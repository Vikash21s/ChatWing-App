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
            Text("Vikash Sharma", style: Theme.of(context).textTheme.bodyLarge),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin:
            EdgeInsets.all(5), // yha se mujhe text box ka margin set krna hai
        padding: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 20), // yha se text box ka size change kr skte hain
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Theme.of(context).colorScheme.primaryContainer),
        child: Row(
          children: [
            Container(
              width: 30, // uski configuration 30, 30 hai
              height: 30,
              child: SvgPicture.asset(
                AssetsImage.chatMicSvg,
                width: 25,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    filled: false,
                    hintText:
                        "Type message ..."), // ye text box me hint ke liye use hua hai
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: 35, // uski configuration 30, 30 hai
              height: 30,
              child: SvgPicture.asset(
                AssetsImage.chatGallarySvg,
                width: 25,
              ),
            ),
            Container(
              width: 35,
              height: 38,
              child: SvgPicture.asset(
                AssetsImage.chatSendSvg,
                width: 25,
              ),
            ), // yha se send box ka size change kr skte hain
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
