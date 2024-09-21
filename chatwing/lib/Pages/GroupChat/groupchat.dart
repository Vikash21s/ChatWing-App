import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatwing/Config/images.dart';
import 'package:chatwing/Controller/chatcontroller.dart';
import 'package:chatwing/Controller/groupcontroller.dart';
import 'package:chatwing/Controller/profilecontroller.dart';
import 'package:chatwing/Model/groupmodel.dart';
import 'package:chatwing/Pages/Chat/Widgets/chatbubble.dart';
import 'package:chatwing/Pages/GroupChat/grouptypemessage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class GroupChatPage extends StatelessWidget {
  final GroupModel groupModel;
  const GroupChatPage({super.key, required this.groupModel});

  @override
  Widget build(BuildContext context) {
    GroupController groupController = Get.put(GroupController());
    ProfileController profileController = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          splashColor: Colors.transparent, //
          highlightColor:
              Colors.transparent, // this is help to remove tap colors
          onTap: () {
            // Get.to(UserProfilePage(
            //   userModel: userModel,
            // ));
          },
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              // width: 50,
              // height: 50,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CachedNetworkImage(
                    imageUrl: groupModel.profileUrl == ""
                        ? AssetsImage.defaultProfileUrl
                        : groupModel.profileUrl!,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )),
            ),
          ),
        ),
        title: InkWell(
          splashColor: Colors.transparent, //
          highlightColor:
              Colors.transparent, // this is use to remove touch effect
          onTap: () {
            // Get.to(UserProfilePage(
            //   userModel: userModel,
            // ));
          },
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment
                    .start, // if remove Row wrapping on this code we can change tap
                children: [
                  Text(groupModel.name ?? "Group Name",
                      style: Theme.of(context).textTheme.bodyLarge),
                  Text(
                    "online",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
            ],
          ),
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
          padding: EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    StreamBuilder(
                        stream:
                            groupController.getGroupMessages(groupModel.id!),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (snapshot.hasError) {
                            return Center(
                              child: Text("Error: ${snapshot.error}"),
                            );
                          }
                          if (snapshot.data == null) {
                            return const Center(
                              child: Text("No Messages"),
                            );
                          } else {
                            return ListView.builder(
                                reverse: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  DateTime timestamp = DateTime.parse(
                                      snapshot.data![index].timestamp!);
                                  String formattedTime =
                                      DateFormat('hh:mm a').format(timestamp);

                                  return ChatBubble(
                                    message: snapshot.data![index].message!,
                                    imageUrl:
                                        snapshot.data![index].imageUrl ?? "",
                                    isComming: snapshot.data![index].senderId !=
                                        profileController.currentUser.value
                                            .id, //change the text positon check left or right
                                    status: "read",
                                    time: formattedTime,
                                  );
                                });
                          }
                        }),
                    Obx(
                      () => (groupController.selectedImagePath.value != "")
                          ? Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: FileImage(
                                          File(groupController
                                              .selectedImagePath.value),
                                        ),
                                        fit: BoxFit
                                            .contain, //yha  se image ko boxfit cover bhi kr kste hain
                                      ),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    height: 500,
                                  ),
                                  Positioned(
                                    right: 0,
                                    child: IconButton(
                                      onPressed: () {
                                        groupController
                                            .selectedImagePath.value = "";
                                      },
                                      icon: Icon(Icons.close),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                    )
                  ],
                ),
              ),
              GroupTypeMessage(
                groupModel: groupModel,
              ),
            ],
          )),
    );
  }
}
