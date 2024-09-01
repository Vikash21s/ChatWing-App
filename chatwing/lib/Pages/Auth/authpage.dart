import 'package:chatwing/Pages/Auth/Widgets/authpagebody.dart';
import 'package:chatwing/Pages/Welcome/Widgets/welcomeheading.dart';
import 'package:flutter/material.dart';

class Authpage extends StatelessWidget {
  const Authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Welcomeheading(),
              SizedBox(height: 40),
              AuthPageBody(),
            ],
          ),
        ),
      ),
    );
  }
}
