import 'package:chatwing/Config/images.dart';
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
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed("/chatPage");
                  },
                  child: ChatTile(
                    imageUrl: AssetsImage.boyPic,
                    name: "Vikash Sharma",
                    lastChat: "Okay Bye",
                    lastTime: "09:21 PM",
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed("/chatPage");
                  },
                  child: ChatTile(
                    imageUrl: AssetsImage.boyPic,
                    name: "vishal Tyagi",
                    lastChat: "Okay Bye",
                    lastTime: "09:21 PM",
                  ),
                ),
                ChatTile(
                  imageUrl: AssetsImage.boyPic,
                  name: "Deepak",
                  lastChat: "Okay Bye",
                  lastTime: "09:21 PM",
                ),
                ChatTile(
                  imageUrl: AssetsImage.boyPic,
                  name: "Rahul",
                  lastChat: "Okay Bye",
                  lastTime: "09:25 PM",
                ),
                ChatTile(
                  imageUrl: AssetsImage.girlPic,
                  name: "Khushi",
                  lastChat: "Okay Bye",
                  lastTime: "10:11 PM",
                ),
                ChatTile(
                  imageUrl: AssetsImage.girlPic,
                  name: "Karan",
                  lastChat: "Okay Bye",
                  lastTime: "05:15 PM",
                ),
                ChatTile(
                  imageUrl: AssetsImage.boyPic,
                  name: "Khushal",
                  lastChat: "Okay Bye",
                  lastTime: "09:25 PM",
                ),
                ChatTile(
                  imageUrl: AssetsImage.girlPic,
                  name: "Aryan",
                  lastChat: "Okay Bye",
                  lastTime: "10:11 PM",
                ),
                ChatTile(
                  imageUrl: AssetsImage.girlPic,
                  name: "Devansh Nandan",
                  lastChat: "Okay Bye",
                  lastTime: "05:15 PM",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
