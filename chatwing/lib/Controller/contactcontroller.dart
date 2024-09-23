import 'package:chatwing/Model/chatroommodel.dart';
import 'package:chatwing/Model/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  RxList<UserModel> userList = <UserModel>[].obs;
  RxList<ChatRoomModel> chatRoomList = <ChatRoomModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getUserList();
    chatRoomList.bindStream(getChatRoomStream());
  }

  Future<void> getUserList() async {
    isLoading.value = true;
    try {
      userList.clear();
      await db.collection("users").get().then(
            (value) => {
              userList.value = value.docs
                  .map(
                    (e) => UserModel.fromJson(
                      e.data(),
                    ),
                  )
                  .toList(),
            },
          );
    } catch (ex) {
      print(ex);
    }
    isLoading.value = false;
  }

  Stream<List<ChatRoomModel>> getChatRoomStream() {
    return db
        .collection('chats')
        .orderBy("timestamp", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<ChatRoomModel> retVal = [];
      query.docs.forEach((element) {
        retVal.add(
            ChatRoomModel.fromJson(element.data() as Map<String, dynamic>));
      });
      return retVal
          .where((e) => e.id!.contains(auth.currentUser!.uid))
          .toList();
    });
  }

  Future<void> saveContact(UserModel user) async {
    try {
      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .collection("contacts")
          .doc(user.id)
          .set(user.toJson());
    } catch (ex) {
      if (kDebugMode) {
        print("Error While Saving Contact 😁😁😁😁😁😁😁😁😁" + ex.toString());
      }
    }
  }

  Stream<List<UserModel>> getContacts() {
    return db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("contacts")
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => UserModel.fromJson(doc.data()),
              )
              .toList(),
        );
  }

  void getChatRoomList() {}
}
