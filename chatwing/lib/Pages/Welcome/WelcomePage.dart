import 'package:chatwing/Config/Images.dart';
import 'package:chatwing/Config/strings.dart';
import 'package:chatwing/Pages/Welcome/Widgets/welcomebody.dart';
import 'package:chatwing/Pages/Welcome/Widgets/welcomeheading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 30),
              Welcomeheading(),
              SizedBox(height: 60),
              WelcomeBody(),
            ],
          ),
        ),
      ),
    );
  }
}
