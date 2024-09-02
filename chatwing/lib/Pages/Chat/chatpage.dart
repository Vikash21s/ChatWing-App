import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Deepak Kumar"),
            Text(
              "online",
              style: Theme.of(context).textTheme.labelSmall,
            )
          ],
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
