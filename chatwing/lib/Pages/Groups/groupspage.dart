import 'package:chatwing/Config/images.dart';
import 'package:chatwing/Controller/groupcontroller.dart';
import 'package:chatwing/Pages/GroupChat/groupchat.dart';
import 'package:chatwing/Pages/HomePage/Widget/chattile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupsPage extends StatelessWidget {
  const GroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    GroupController groupController = Get.put(GroupController());
    return Obx(
      () => ListView(
        children: groupController.groupList
            .map(
              (group) => InkWell(
                onTap: () {
                  Get.to(GroupChatPage(groupModel: group));
                },
                child: ChatTile(
                  name: group.name!,
                  imageUrl: group.profileUrl == ""
                      ? AssetsImage.defaultProfileUrl
                      : group.profileUrl!,
                  lastChat: "Group Created",
                  lastTime: "Just Now",
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
