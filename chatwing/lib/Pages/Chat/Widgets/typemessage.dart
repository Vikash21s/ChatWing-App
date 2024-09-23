import 'package:chatwing/Config/images.dart';
import 'package:chatwing/Controller/chatcontroller.dart';
import 'package:chatwing/Controller/imagepicker.dart';
import 'package:chatwing/Model/usermodel.dart';
import 'package:chatwing/Widget/imagepickerbottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TypeMessage extends StatelessWidget {
  final UserModel userModel;
  const TypeMessage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    TextEditingController messageController = TextEditingController();
    RxString message = "".obs;
    ImagePickerController imagePickerController =
        Get.put(ImagePickerController());

    return Container(
      margin: const EdgeInsets.all(5), // yha se mujhe text box ka margin set krna hai
      padding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 20), // yha se text box ka size change kr skte hain
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Theme.of(context).colorScheme.primaryContainer),
      child: Row(
        children: [
          SizedBox(
            width: 30, // uski configuration 30, 30 hai
            height: 30,
            child: SvgPicture.asset(
              AssetsImage.chatEmoji,
              width: 25,
            ),
          ),
          const SizedBox(width: 10),
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
          const SizedBox(width: 10),
          Obx(
            () => chatController.selectedImagePath.value == ""
                ? InkWell(
                    onTap: () {
                      ImagePickerBottomSheet(
                          context,
                          chatController.selectedImagePath,
                          imagePickerController);
                    },
                    child: SizedBox(
                      width: 35, // uski configuration 30, 30 hai
                      height: 30,
                      child: SvgPicture.asset(
                        AssetsImage.chatGallarySvg,
                        width: 25,
                      ),
                    ),
                  )
                : const SizedBox(),
          ),
          const SizedBox(width: 10),

          Obx(
            () => message.value != "" ||
                    chatController.selectedImagePath.value != ""
                ? InkWell(
                    splashColor: Colors.transparent, //
                    highlightColor: Colors
                        .transparent, // this is use to remove touch effect
                    onTap: () {
                      if (messageController.text.isNotEmpty ||
                          chatController.selectedImagePath.value.isNotEmpty) {
                        chatController.sendMessage(
                            userModel.id!, messageController.text, userModel);
                        messageController.clear();
                        message.value = "";
                      }
                    },
                    child: SizedBox(
                      width: 35,
                      height: 38,
                      child: chatController.isLoading.value
                          ? const CircularProgressIndicator()
                          : SvgPicture.asset(
                              AssetsImage.chatSendSvg,
                              width: 25,
                            ),
                    ),
                  )
                : SizedBox(
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
