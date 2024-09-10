import 'package:chatwing/Config/images.dart';
import 'package:chatwing/Controller/authcontroller.dart';
import 'package:chatwing/Controller/profilecontroller.dart';
import 'package:chatwing/Pages/UserProfile/Widgets/userinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    Authcontroller authcontroller = Get.put(Authcontroller());
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed("/updateProfilePage");
            },
            icon: Icon(
              Icons.edit,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            LoginUserInfo(),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                authcontroller.logoutUser();
              },
              child: Text("Logout"),
            )
          ],
        ),
      ),
    );
  }
}
