import 'package:chatwing/Controller/profilecontroller.dart';
import 'package:chatwing/Model/groupmodel.dart';
import 'package:chatwing/Model/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class GroupController extends GetxController {
  RxList<UserModel> groupMembers = <UserModel>[].obs;
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  var uuid = Uuid();
  ProfileController profileController = Get.put(ProfileController());

  void selectMember(UserModel user) {
    if (groupMembers.contains(user)) {
      groupMembers.remove(user);
    } else {
      groupMembers.add(user);
    }
  }

  Future<void> createGroup(String groupName, String imagePath) async {
    String groupId = uuid.v6();

    try {
      String imageUrl = await profileController.uploadFileToFirebase(imagePath);

      await db.collection("groups").doc(groupId).set(
        {
          "id": groupId,
          "name": groupName,
          "profileUrl": imageUrl,
          "members": groupMembers.map((e) => e.toJson()).toList(),
          "createdAt": DateTime.now().toString(),
          "createdBy": auth.currentUser!.uid,
          "timeStamp": DateTime.now().toString(),
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
