import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isComming;
  final String time;
  final String status;
  final String imageUrl;
  const ChatBubble(
      {super.key,
      required this.message,
      required this.isComming,
      required this.time,
      required this.status,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      constraints: BoxConstraints(
          //minWidth: 100,
          maxWidth: MediaQuery.sizeOf(context).width / 1.3),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(0), // we can change text box
          topRight: Radius.circular(15),
          bottomLeft: Radius.circular(17),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Text(message),
    );
  }
}
