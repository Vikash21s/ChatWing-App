import 'package:chatwing/Config/images.dart';
import 'package:chatwing/Pages/HomePage/Widget/chattile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        InkWell(
          onTap: () {
            Get.toNamed("/chatPage");
          },
          child: ChatTile(
            imageUrl: AssetsImage.defaultProfileUrl,
            name: "Vikash Sharma",
            lastChat: "Okay Bye",
            lastTime: "09:21 PM",
          ),
        ),
        ChatTile(
          imageUrl: AssetsImage.defaultProfileUrl,
          name: "Rahul",
          lastChat: "Okay Bye",
          lastTime: "09:21 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.defaultProfileUrl,
          name: "Deepak",
          lastChat: "Okay Bye",
          lastTime: "09:25 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.defaultProfileUrl,
          name: "Khushi",
          lastChat: "Okay Bye",
          lastTime: "10:11 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.defaultProfileUrl,
          name: "Barkha mam",
          lastChat: "Okay Bye",
          lastTime: "05:15 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.defaultProfileUrl,
          name: "Bunty",
          lastChat: "Hey!",
          lastTime: "05:15 PM",
        ),
      ],
    );
  }
}
