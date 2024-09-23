import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatwing/Config/images.dart';
import 'package:chatwing/Controller/groupcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectedMembers extends StatelessWidget {
  const SelectedMembers({super.key});

  @override
  Widget build(BuildContext context) {
    GroupController groupController = Get.put(GroupController());
    return Obx(
      () => Row(
          children: groupController.groupMembers
              .map((e) => Stack(
                    children: [
                      Container(
                          margin: const EdgeInsets.all(10),
                          width: 70,
                          height: 70,
                          decoration: const BoxDecoration(),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: CachedNetworkImage(
                              imageUrl: e.profileImage ??
                                  AssetsImage.defaultProfileUrl,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          )),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: InkWell(
                          onTap: () {
                            groupController.groupMembers.remove(e);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Icon(
                              Icons.close,
                              color: Colors.black,
                              size: 15,
                            ),
                          ),
                        ),
                      )
                    ],
                  ))
              .toList()),
    );
  }
}
