import 'package:chatwing/Config/images.dart';
import 'package:chatwing/Controller/contactcontroller.dart';
import 'package:chatwing/Pages/Chat/chatpage.dart';
import 'package:chatwing/Pages/HomePage/Widget/chattile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    ContactController contactController = Get.put(ContactController());
    return Obx(
      () => ListView(
        children: contactController.chatRoomList
            .map(
              (e) => InkWell(
                onTap: () {
                  Get.to(ChatPage(userModel: e.receiver!));
                },
                child: ChatTile(
                  imageUrl:
                      e.receiver!.profileImage ?? AssetsImage.defaultProfileUrl,
                  name: e.receiver!.name ?? "User_101",
                  lastChat: e.lastMessage ?? "Last Message",
                  lastTime: e.lastMessageTimestamp ?? "Last Time",
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
