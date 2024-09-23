import 'package:chatwing/Config/images.dart';
import 'package:chatwing/Controller/chatcontroller.dart';
import 'package:chatwing/Pages/HomePage/Widget/chattile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallHistory extends StatelessWidget {
  const CallHistory({super.key});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    return StreamBuilder(
        stream: chatController.getCalls(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ChatTile(
                  imageUrl: snapshot.data![index].callerPic! ??
                      AssetsImage.defaultProfileUrl,
                  name: snapshot.data![index].callerName ?? "...",
                  lastChat: snapshot.data![index].time ?? "...",
                  lastTime: "",
                );
              },
            );
          } else {
            return Center(
              child: Container(
                width: 200,
                height: 200,
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
