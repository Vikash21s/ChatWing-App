import 'package:chatwing/Config/images.dart';
import 'package:chatwing/Controller/authcontroller.dart';
import 'package:chatwing/Controller/profilecontroller.dart';
import 'package:chatwing/Model/usermodel.dart';
import 'package:chatwing/Pages/UserProfile/Widgets/userinfo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfilePage extends StatelessWidget {
  final UserModel userModel;
  const UserProfilePage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    Authcontroller authcontroller = Get.put(Authcontroller());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed("/updateProfilePage");
            },
            icon: const Icon(
              Icons.edit,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            LoginUserInfo(
              profileImage:
                  userModel.profileImage ?? AssetsImage.defaultProfileUrl,
              userName: userModel.name ?? "User_2112",
              userEmail: userModel.email ?? "",
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                authcontroller.logoutUser();
              },
              child: const Text("Logout"),
            )
          ],
        ),
      ),
    );
  }
}
