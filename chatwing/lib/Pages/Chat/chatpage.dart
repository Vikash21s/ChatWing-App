import 'package:chatwing/Config/images.dart';
import 'package:chatwing/Pages/Chat/Widgets/chatbubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer),
        child: Row(
          children: [
            SvgPicture.asset(AssetsImage.chatMicSvg),
            Expanded(
              child: TextField(),
            ),
            SvgPicture.asset(AssetsImage.chatGallarySvg),
            SvgPicture.asset(AssetsImage.chatSendSvg),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
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
              imageUrl: "https://picsum.photos/250?image=9",
              isComming: false,
              status: "read",
              time: "10:10 AM",
            ),
            ChatBubble(
              message: "Hello How are you ?",
              imageUrl: "",
              isComming: true,
              status: "read",
              time: "10:10 AM",
            ),
            ChatBubble(
              message: "Hi bro kya haal ?",
              imageUrl: "https://picsum.photos/250?image=9",
              isComming: true,
              status: "read",
              time: "10:10 AM",
            ),
          ],
        ),
      ),
    );
  }
}
