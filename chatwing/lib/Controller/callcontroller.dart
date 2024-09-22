import 'package:chatwing/Model/audiocall.dart';
import 'package:chatwing/Model/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:uuid/uuid.dart';

class CallController extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final uuid = Uuid().v6();

  void onInit() {
    super.onInit();
    getCallsNotification().listen((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        Get.snackbar("Calling", "Calling");
      }
    });
  }

  Future<void> callAction(UserModel receiver, UserModel caller) async {
    String id = uuid;
    var newCall = AudioCallModel(
      id: id,
      callerName: caller.name,
      callerPic: caller.profileImage,
      callerUid: caller.id,
      callerEmail: caller.email,
      receiverName: receiver.name,
      receiverPic: receiver.profileImage,
      receiverUid: receiver.id,
      receiverEmail: receiver.email,
      status: "dialing",
    );

    try {
      await db
          .collection("notification")
          .doc(receiver.id) // yha uske me doc(receiver.id)   hai..
          .collection("call")
          .doc(id) //
          .set(newCall.toJson());
      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .collection("calls")
          .doc(id)
          .set(newCall.toJson());
      await db
          .collection("users")
          .doc(receiver.id)
          .collection("calls")
          .doc(id)
          .set(newCall.toJson());
      Future.delayed(Duration(seconds: 20), () {
        endCall(newCall);
      });
    } catch (e) {
      print(e);
      print(
          "🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥");
    }
  }

  Stream<QuerySnapshot> getCallsNotification() {
    return db
        .collection("notification")
        .doc(auth.currentUser!.uid)
        .collection("call")
        .snapshots();
  }

  Future<void> endCall(AudioCallModel call) async {
    try {
      await db
          .collection("notification")
          .doc(call.receiverUid)
          .collection("call")
          .doc(call.id)
          .delete();
    } catch (e) {
      print(e);
    }
  }
}
