import 'package:chatwing/Controller/profilecontroller.dart';
import 'package:chatwing/Model/chatmodel.dart';
import 'package:chatwing/Model/chatroommodel.dart';
import 'package:chatwing/Model/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:uuid/uuid.dart';

class ChatController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;
  var uuid = Uuid();
  ProfileController controller = Get.put(ProfileController());

  String getRoomId(String targetUserId) {
    String currentUserId = auth.currentUser!.uid;
    if (currentUserId[0].codeUnitAt(0) > targetUserId[0].codeUnitAt(0)) {
      return currentUserId + targetUserId;
    } else {
      return targetUserId + currentUserId;
    }
  }

  Future<void> sendMessage(
    String targetUserId,
    String message,
    UserModel targetUser,
  ) async {
    isLoading.value = true;
    String chatId = uuid.v6();
    String roomId = getRoomId(targetUserId);
    var newChat = ChatModel(
      id: chatId,
      message: message,
      senderId: auth.currentUser!.uid,
      receiverId: targetUserId,
      senderName: controller.currentUser.value.name,
      timestamp: DateTime.now().toString(),
    );

    var roomDetails = ChatRoomModel(
      id: roomId,
      lastMessage: message,
      lastMessageTimestamp: DateTime.now().toString(),
      sender: controller.currentUser.value,
      receiver: targetUser,
      timestamp: DateTime.now().toString(),
      unReadMessNo: 0,
    );
    try {
      await db.collection("chats").doc(roomId).set(
            roomDetails.toJson(),
          );
      await db
          .collection("chats")
          .doc(roomId)
          .collection("message")
          .doc(chatId)
          .set(
            newChat.toJson(),
          );
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  Stream<List<ChatModel>> getMessages(String targetUserId) {
    String roomId = getRoomId(targetUserId);
    return db
        .collection("chats")
        .doc(roomId)
        .collection("message")
        .orderBy("timestamp", descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map(
              (doc) => ChatModel.fromJson(doc.data()),
            )
            .toList());
  }
}
