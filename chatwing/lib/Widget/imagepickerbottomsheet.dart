import 'package:chatwing/Controller/imagepicker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

Future<dynamic> ImagePickerBottomSheet(BuildContext context, RxString imagePath,
    ImagePickerController imagePickerController) {
  return Get.bottomSheet(Container(
    height: 150,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment
          .spaceEvenly, //change space camera or gallery loaction
      children: [
        InkWell(
          onTap: () async {
            imagePath.value =
                await imagePickerController.pickImage(ImageSource.camera);
            Get.back();
          },
          child: Container(
            height: 90, // change camera height default 70 70
            width: 90,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(20)),
            child: const Icon(
              Icons.camera_alt_rounded,
              size: 30,
            ),
          ),
        ),
        InkWell(
          onTap: () async {
            imagePath.value =
                await imagePickerController.pickImage(ImageSource.gallery);
            Get.back();
          },
          child: Container(
            height: 90, // change camera height default 70 70
            width: 90,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(20)),
            child: const Icon(
              Icons.photo,
              size: 30,
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            height: 90, // change camera height default 70 70
            width: 90,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(20)),
            child: const Icon(
              Icons.play_arrow,
              size: 50,
            ),
          ),
        )
      ],
    ),
  ));
}
