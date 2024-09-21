import 'package:chatwing/Config/images.dart';
import 'package:chatwing/Controller/chatcontroller.dart';
import 'package:chatwing/Controller/groupcontroller.dart';
import 'package:chatwing/Controller/imagepicker.dart';
import 'package:chatwing/Model/groupmodel.dart';
import 'package:chatwing/Model/usermodel.dart';
import 'package:chatwing/Widget/imagepickerbottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

class GroupTypeMessage extends StatelessWidget {
  final GroupModel groupModel;
  const GroupTypeMessage({super.key, required this.groupModel});

  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();
    RxString message = "".obs;
    ImagePickerController imagePickerController =
        Get.put(ImagePickerController());
    GroupController groupController = Get.put(GroupController());

    return Container(
      margin: EdgeInsets.all(5), // yha se mujhe text box ka margin set krna hai
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
              AssetsImage.chatEmoji,
              width: 25,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              onChanged: (value) {
                message.value = value;
              },
              controller: messageController,
              decoration: const InputDecoration(
                  filled: false,
                  hintText:
                      "Type message ..."), // ye text box me hint ke liye use hua hai
            ),
          ),
          SizedBox(width: 10),
          Obx(
            () => groupController.selectedImagePath.value == ""
                ? InkWell(
                    onTap: () {
                      ImagePickerBottomSheet(
                          context,
                          groupController.selectedImagePath,
                          imagePickerController);
                    },
                    child: Container(
                      width: 35, // uski configuration 30, 30 hai
                      height: 30,
                      child: SvgPicture.asset(
                        AssetsImage.chatGallarySvg,
                        width: 25,
                      ),
                    ),
                  )
                : SizedBox(),
          ),
          SizedBox(width: 10),

          Obx(
            () => message.value != "" ||
                    groupController.selectedImagePath.value != ""
                ? InkWell(
                    splashColor: Colors.transparent, //
                    highlightColor: Colors
                        .transparent, // this is use to remove touch effect
                    onTap: () {
                      groupController.sendGroupMessage(
                        messageController.text,
                        groupModel.id!,
                        "",
                      );
                      messageController.clear();
                      message.value = "";
                    },
                    child: Container(
                      width: 35,
                      height: 38,
                      child: groupController.isLoading.value
                          ? CircularProgressIndicator()
                          : SvgPicture.asset(
                              AssetsImage.chatSendSvg,
                              width: 25,
                            ),
                    ),
                  )
                : Container(
                    width: 30, // uski configuration 30, 30 hai
                    height: 30,
                    child: SvgPicture.asset(
                      AssetsImage.chatMicSvg,
                      width: 25,
                    ),
                  ),
          ), // yha se send box ka size change kr skte hain
        ],
      ),
    );
  }
}
