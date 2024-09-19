import 'package:chatwing/Config/images.dart';
import 'package:chatwing/Controller/contactcontroller.dart';
import 'package:chatwing/Controller/profilecontroller.dart';
import 'package:chatwing/Pages/Chat/chatpage.dart';
import 'package:chatwing/Pages/HomePage/Widget/chattile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    ContactController contactController = Get.put(ContactController());
    ProfileController profileController = Get.put(ProfileController());
    return RefreshIndicator(
      child: Obx(
        () => ListView(
          children: contactController.chatRoomList
              .map(
                (e) => InkWell(
                  splashColor: Colors.transparent, //
                  highlightColor:
                      Colors.transparent, // this is use to remove touch effect
                  onTap: () {
                    Get.to(
                      ChatPage(
                        userModel: (e.receiver!.id ==
                                profileController.currentUser.value.id
                            ? e.sender
                            : e.receiver)!,
                      ),
                    );
                  },
                  child: ChatTile(
                    imageUrl: (e.receiver!.id ==
                                profileController.currentUser.value.id
                            ? e.sender!.profileImage
                            : e.receiver!.profileImage) ??
                        AssetsImage.defaultProfileUrl,
                    name: (e.receiver!.id ==
                            profileController.currentUser.value.id
                        ? e.sender!.name
                        : e.receiver!.name)!,
                    lastChat: e.lastMessage ?? "Last Message",
                    lastTime: e.lastMessageTimestamp ?? "Last Time",
                  ),
                ),
              )
              .toList(),
        ),
      ),
      onRefresh: () {
        return contactController.getChatRoomList();
      },
    );
  }
}
