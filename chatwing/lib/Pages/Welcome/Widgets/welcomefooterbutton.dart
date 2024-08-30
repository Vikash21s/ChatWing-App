import 'package:chatwing/Config/images.dart';
import 'package:chatwing/Config/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:slide_to_act/slide_to_act.dart';

class WelcomeFooterButton extends StatelessWidget {
  const WelcomeFooterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideAction(
      onSubmit: () {},
      sliderButtonIcon: Container(
        width: 25,
        height: 25,
        child: SvgPicture.asset(
          AssetsImage.plugSVG,
          width: 25,
        ),
      ),
      text: WelcomePageString.slideToStart,
      textStyle: Theme.of(context).textTheme.labelLarge,
      // sliderRotate: false, // isko rotate nahi krna tb hai ye
      submittedIcon: SvgPicture.asset(AssetsImage.connectSVG, width: 25),
      innerColor: Theme.of(context).colorScheme.primary,
      outerColor: Theme.of(context).colorScheme.primaryContainer,
    );
  }
}
