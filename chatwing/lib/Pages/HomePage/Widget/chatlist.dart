import 'package:chatwing/Config/images.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: Row(
            children: [
              Image.asset(
                AssetsImage.girlPic,
                width: 70,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Deepak"),
                  Text("Baad Me bat krte hain"),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
