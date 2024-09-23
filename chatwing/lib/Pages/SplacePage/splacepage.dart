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
        child: SvgPicture.asset(
          AssetsImage
              .appIconSVG, // Bro yha pr change kr app ka lo splace screen pr
        ),
      ),
    );
  }
}
