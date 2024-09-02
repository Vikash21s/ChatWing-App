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
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Deepak",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 2), // we can change both text distance
                  Text(
                    "Baad Me bat krte hain",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
