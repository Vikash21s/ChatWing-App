import 'package:flutter/material.dart';

class Authpage extends StatelessWidget {
  const Authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auth page"),
      ),
      body: const Column(
        children: [
          Text("Auth page"),
        ],
      ),
    );
  }
}
