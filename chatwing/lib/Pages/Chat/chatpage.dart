import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatwing/Config/images.dart';
import 'package:chatwing/Controller/chatcontroller.dart';
import 'package:chatwing/Controller/profilecontroller.dart';
import 'package:chatwing/Model/chatmodel.dart';
import 'package:chatwing/Model/usermodel.dart';
import 'package:chatwing/Pages/Chat/Widgets/chatbubble.dart';
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
                controller: messageController,
                decoration: const InputDecoration(
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
            InkWell(
              splashColor: Colors.transparent, //
              highlightColor:
                  Colors.transparent, // this is use to remove touch effect
              onTap: () {
                if (messageController.text.isNotEmpty) {
                  chatController.sendMessage(
                      userModel.id!, messageController.text, userModel);
                  messageController.clear();
                }
              },
              child: Container(
                width: 35,
                height: 38,
                child: SvgPicture.asset(
                  AssetsImage.chatSendSvg,
                  width: 25,
                ),
              ),
            ), // yha se send box ka size change kr skte hain
          ],
        ),
      ),
      body: Padding(
          padding: EdgeInsets.only(bottom: 70, top: 10, left: 10, right: 10),
          child: StreamBuilder<List<ChatModel>>(
              stream: chatController.getMessages(userModel.id!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
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
                        DateTime timestamp =
                            DateTime.parse(snapshot.data![index].timestamp!);
                        String formattedTime =
                            DateFormat('hh:mm a').format(timestamp);

                        return ChatBubble(
                          message: snapshot.data![index].message!,
                          imageUrl: snapshot.data![index].imageUrl ?? "",
                          isComming: snapshot.data![index].receiverId ==
                              profileController.currentUser.value.id,
                          status: "read",
                          time: formattedTime,
                        );
                      });
                }
              })),
    );
  }
}
