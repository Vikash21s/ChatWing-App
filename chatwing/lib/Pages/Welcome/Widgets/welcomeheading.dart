import 'package:chatwing/Config/images.dart';
import 'package:chatwing/Config/strings.dart';
import 'package:flutter/material.dart';

class Welcomeheading extends StatelessWidget {
  const Welcomeheading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsImage.logomain,
              fit: BoxFit.contain, // Adjust the fit property here
              height: 200.0, // Set a specific height
              width: 200.0, // Set a specific width
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          AppString.appName,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 36.0, // Increase the font size
                fontWeight: FontWeight.w900, // Increase the weight to make it bolder
                color: Theme.of(context).colorScheme.secondary,
              ),
        ),
      ],
    );
  }
}
