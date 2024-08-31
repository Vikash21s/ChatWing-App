import 'package:chatwing/Config/Images.dart';
import 'package:chatwing/Config/strings.dart';
import 'package:chatwing/Pages/Welcome/Widgets/welcomebody.dart';
import 'package:chatwing/Pages/Welcome/Widgets/welcomefooterbutton.dart';
import 'package:chatwing/Pages/Welcome/Widgets/welcomeheading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:slide_to_act/slide_to_act.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Welcomeheading(),
              WelcomeBody(),
              WelcomeFooterButton(),
            ],
          ),
        ),
      ),
    );
  }
}
