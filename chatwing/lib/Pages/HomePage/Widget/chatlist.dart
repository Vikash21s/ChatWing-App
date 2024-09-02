import 'package:chatwing/Config/images.dart';
import 'package:chatwing/Pages/HomePage/Widget/chattile.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ChatTile(),
        ChatTile(),
        ChatTile(),
        ChatTile(),
        ChatTile(),
        ChatTile(),
        ChatTile(),
        ChatTile(),
        ChatTile(),
        ChatTile(),
        ChatTile(),
        ChatTile(),
        ChatTile(),
        ChatTile(),
        ChatTile(),
        ChatTile(),
        ChatTile(),
        ChatTile(),
      ],
    );
  }
}
