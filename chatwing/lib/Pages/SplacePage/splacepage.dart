import 'package:chatwing/Config/images.dart';
import 'package:chatwing/Controller/splacecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Splacepage extends StatelessWidget {
  const Splacepage({super.key});

  @override
  Widget build(BuildContext context) {
    SplaceController splaceController = Get.put(SplaceController());
    return Scaffold(
      body: Center(
          child: Image.asset(
            AssetsImage.logomain,
            fit: BoxFit.contain,
            height: 200.0,
            width: 200.0,
          )),
    );
  }
}














