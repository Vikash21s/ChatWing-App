import 'package:chatwing/Config/images.dart';
import 'package:chatwing/Pages/Chat/Widgets/chatbubble.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset(AssetsImage.boyPic),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Deepak", style: Theme.of(context).textTheme.bodyLarge),
            Text(
              "online",
              style: Theme.of(context).textTheme.labelSmall,
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.phone,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.video_call,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ChatBubble(
              message: "Hello How are you ?",
              imageUrl: "",
              isComming: true,
              status: "read",
              time: "10:10 AM",
            ),
            ChatBubble(
              message: "Hello How are you ?",
              imageUrl: "",
              isComming: false,
              status: "read",
              time: "10:10 AM",
            ),
            ChatBubble(
              message: "Hi bro kya haal ?",
              imageUrl:
                  "https://www.google.com/imgres?q=ganesh&imgurl=https%3A%2F%2Fih1.redbubble.net%2Fimage.5142852451.9909%2Fflat%2C750x%2C075%2Cf-pad%2C750x1000%2Cf8f8f8.jpg&imgrefurl=https%3A%2F%2Fwww.redbubble.com%2Fi%2Fposter%2FLord-Ganesh-Digital-Painting-by-Mystikosart%2F149609909.LVTDI&docid=FLpLcTES1tC5CM&tbnid=Kt8wisSw-L0nWM&vet=12ahUKEwjl06DIoqWIAxXQUGcHHSZnJ-QQM3oECH0QAA..i&w=750&h=1000&hcb=2&ved=2ahUKEwjl06DIoqWIAxXQUGcHHSZnJ-QQM3oECH0QAA",
              isComming: false,
              status: "read",
              time: "10:10 AM",
            ),
          ],
        ),
      ),
    );
  }
}
