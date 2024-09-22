import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatwing/Config/images.dart';
import 'package:chatwing/Controller/chatcontroller.dart';
import 'package:chatwing/Controller/profilecontroller.dart';
import 'package:chatwing/Model/chatmodel.dart';
import 'package:chatwing/Model/usermodel.dart';
import 'package:chatwing/Pages/Chat/Widgets/chatbubble.dart';
import 'package:chatwing/Pages/Chat/Widgets/typemessage.dart';
import 'package:chatwing/Pages/UserProfile/profilepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatelessWidget {
  final UserModel userModel;
  const ChatPage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    TextEditingController messageController = TextEditingController();
    ProfileController profileController = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          splashColor: Colors.transparent, //
          highlightColor:
              Colors.transparent, // this is help to remove tap colors
          onTap: () {
            Get.to(UserProfilePage(
              userModel: userModel,
            ));
          },
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              // width: 50,
              // height: 50,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CachedNetworkImage(
                    imageUrl:
                        userModel.profileImage ?? AssetsImage.defaultProfileUrl,
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
            Get.to(UserProfilePage(
              userModel: userModel,
            ));
          },
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment
                    .start, // if remove Row wrapping on this code we can change tap
                children: [
                  Text(userModel.name ?? "User_101",
                      style: Theme.of(context).textTheme.bodyLarge),

                  StreamBuilder(
                    stream: chatController.getStatus(userModel.id!),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text("........");
                      } else {
                        return Text(
                          snapshot.data!.status ?? "",
                          style: TextStyle(
                            fontSize: 12,
                            color: snapshot.data!.status == "Online"
                                ? Colors.green
                                : Colors.grey,
                          ),
                        );
                      }
                    },
                  )

                  // Text(
                  //   "online",
                  //   style: Theme.of(context).textTheme.labelSmall,
                  // )
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
                    StreamBuilder<List<ChatModel>>(
                        stream: chatController.getMessages(userModel.id!),
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
                                    isComming: snapshot
                                            .data![index].receiverId ==
                                        profileController.currentUser.value.id,
                                    status: "read",
                                    time: formattedTime,
                                  );
                                });
                          }
                        }),
                    Obx(
                      () => (chatController.selectedImagePath.value != "")
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
                                          File(chatController
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
                                        chatController.selectedImagePath.value =
                                            "";
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
              TypeMessage(
                userModel: userModel,
              ),
            ],
          )),
    );
  }
}
