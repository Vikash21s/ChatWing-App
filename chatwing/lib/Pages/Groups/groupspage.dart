import 'package:chatwing/Config/images.dart';
import 'package:chatwing/Pages/HomePage/Widget/chattile.dart';
import 'package:flutter/material.dart';

class GroupsPage extends StatelessWidget {
  const GroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ChatTile(
            imageUrl: AssetsImage.defaultProfileUrl,
            name: "Study Group",
            lastChat: "Last Message",
            lastTime: "Last Time"),
      ],
    );
  }
}
