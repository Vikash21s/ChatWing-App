import 'package:chatwing/Pages/Welcome/Widgets/welcomebody.dart';
import 'package:chatwing/Pages/Welcome/Widgets/welcomefooterbutton.dart';
import 'package:chatwing/Pages/Welcome/Widgets/welcomeheading.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            
            ],
          ),
        ),
      ),
    );
  }
}
