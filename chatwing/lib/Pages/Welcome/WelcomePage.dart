import 'package:chatwing/Config/Images.dart';
import 'package:chatwing/Config/strings.dart';
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
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 30),
              Welcomeheading(),
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AssetsImage.boyPic),
                  SvgPicture.asset(AssetsImage.connectSVG),
                  Image.asset(AssetsImage.girlPic),
                ],
              ),
              SizedBox(height: 40),
              Text(
                WelcomePageString.nowYouAre,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                WelcomePageString.connected,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 10),
              Text(
                WelcomePageString.discription,
                style: Theme.of(context).textTheme.labelLarge,
              )
            ],
          ),
        ),
      ),
    );
  }
}
