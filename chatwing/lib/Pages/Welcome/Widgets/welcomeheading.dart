import 'package:chatwing/Config/images.dart';
import 'package:chatwing/Config/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Welcomeheading extends StatelessWidget {
  const Welcomeheading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetsImage.appIconSVG,
              //color: Theme.of(context).colorScheme.onBackground,
            ),
          ],
        ),
        SizedBox(height: 20),
        Text(
          AppString.appName,
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(color: Theme.of(context).colorScheme.secondary),
        )
      ],
    );
  }
}
