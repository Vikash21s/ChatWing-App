import 'package:chatwing/Config/images.dart';
import 'package:chatwing/Controller/chatcontroller.dart';
import 'package:chatwing/Controller/contactcontroller.dart';
import 'package:chatwing/Controller/profilecontroller.dart';
import 'package:chatwing/Pages/Chat/chatpage.dart';
import 'package:chatwing/Pages/ContactPage/Widgets/contactsearch.dart';
import 'package:chatwing/Pages/ContactPage/Widgets/newcontacttile.dart';
import 'package:chatwing/Pages/HomePage/Widget/chattile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isSearchEnable = false.obs;
    ContactController contactController = Get.put(ContactController());
    ChatController chatController = Get.put(ChatController());
    ProfileController profileController = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Select contact"),
        actions: [
          Obx(
            () => IconButton(
              onPressed: () {
                isSearchEnable.value = !isSearchEnable.value;
              },
              icon:
                  isSearchEnable.value ? Icon(Icons.close) : Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Obx(
              () => isSearchEnable.value ? ContactSearch() : SizedBox(),
            ),
            SizedBox(height: 10),
            NewContactTile(
              btnName: "New Contact",
              icon: Icons.person_add,
              ontap: () {},
            ),
            SizedBox(height: 10),
            NewContactTile(
              btnName: "New Group",
              icon: Icons.group_add,
              ontap: () {},
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text("Contacts on ChatWing"),
              ],
            ),
            SizedBox(height: 10),
            Obx(
              () => Column(
                children: contactController.userList
                    .map(
                      (e) => InkWell(
                        splashColor: Colors.transparent, //
                        highlightColor: Colors
                            .transparent, // this is use to remove touch effect
                        onTap: () {
                          Get.to(ChatPage(userModel: e));
                        },
                        child: ChatTile(
                            imageUrl:
                                e.profileImage ?? AssetsImage.defaultProfileUrl,
                            name: e.name ?? "User 101",
                            lastChat: e.about ?? "Never Giveup",
                            lastTime: e.email ==
                                    profileController.currentUser.value.email
                                ? "You  "
                                : " "),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
