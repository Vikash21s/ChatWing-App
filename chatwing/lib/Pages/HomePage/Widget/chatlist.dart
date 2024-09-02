import 'package:chatwing/Config/images.dart';
import 'package:chatwing/Pages/HomePage/Widget/chattile.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
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
          lastTime: "09:21 PM",
        ),
        ChatTile(
          imageUrl: AssetsImage.boyPic,
          name: "Vikash",
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
          name: "Barkha mam",
          lastChat: "Okay Bye",
          lastTime: "05:15 PM",
        ),
      ],
    );
  }
}
