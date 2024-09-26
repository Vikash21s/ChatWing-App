import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatwing/Config/images.dart';
import 'package:chatwing/Controller/chatcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../Controller/profilecontroller.dart';

class CallHistory extends StatelessWidget {
  const CallHistory({super.key});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    ProfileController profileController = Get.put(ProfileController());

    return StreamBuilder(
      stream: chatController.getCalls(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              DateTime timestamp;
              try {
                timestamp = DateTime.now();
              } catch (e) {
                return ListTile(
                  title: Text('Invalid date format'),
                  subtitle: Text('Error parsing date: $e'),
                );
              }
              String formattedTime = DateFormat('hh:mm a').format(timestamp);

              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CachedNetworkImage(
                    imageUrl: snapshot.data![index].callerUid == profileController.currentUser.value.id
                        ? snapshot.data![index].receiverPic ?? AssetsImage.defaultProfileUrl
                        : snapshot.data![index].callerPic ?? AssetsImage.defaultProfileUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                title: Text(
                  snapshot.data![index].callerUid == profileController.currentUser.value.id
                      ? snapshot.data![index].receiverName!
                      : snapshot.data![index].callerName!,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                subtitle: Text(
                  formattedTime,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                trailing: IconButton(
                  icon: Icon(snapshot.data![index].type == "video" ? Icons.video_call : Icons.call),
                  onPressed: () {
                    // Add your call handling logic here
                  },
                ),
              );
            },
          );
        } else {
          return Center(
            child: Text('No call history available.'),
          );
        }
      },
    );
  }
}
