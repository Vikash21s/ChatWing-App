import 'dart:io';

import 'package:chatwing/Config/images.dart';
import 'package:chatwing/Controller/groupcontroller.dart';
import 'package:chatwing/Controller/imagepicker.dart';
import 'package:chatwing/Pages/HomePage/Widget/chattile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class GroupTitle extends StatelessWidget {
  const GroupTitle({super.key});

  @override
  Widget build(BuildContext context) {
    GroupController groupController = Get.put(GroupController());
    ImagePickerController imagePickerController =
        Get.put(ImagePickerController());
    RxString imagePath = "".obs;
    //RxString groupName = "".obs;
    TextEditingController groupName = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("New Group"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {
          groupController.createGroup(groupName.text, imagePath.value);
        },
        child: Icon(
          Icons.done,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Obx(
                        () => InkWell(
                          onTap: () async {
                            imagePath.value = await imagePickerController
                                .pickImage(ImageSource.gallery);
                          },
                          child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: imagePath.value == ""
                                ? const Icon(
                                    Icons.group,
                                    size: 40,
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.file(
                                      File(imagePath.value),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: groupName,
                        decoration: InputDecoration(
                          hintText: "Group Name",
                          hintStyle: Theme.of(context).textTheme.labelLarge,
                          prefixIcon: Icon(Icons.group),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: groupController.groupMembers
                    .map(
                      (e) => ChatTile(
                          imageUrl:
                              e.profileImage ?? AssetsImage.defaultProfileUrl,
                          name: e.name!,
                          lastChat: e.about ?? '',
                          lastTime: ""),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
