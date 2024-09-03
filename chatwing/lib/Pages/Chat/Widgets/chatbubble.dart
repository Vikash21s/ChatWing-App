import 'package:chatwing/Config/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return Padding(
      padding:
          EdgeInsets.only(bottom: 20), // Change the margin b/w two messages
      child: Column(
        crossAxisAlignment:
            isComming ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
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
              child: imageUrl == ""
                  ? Text(message)
                  : Column(
                      children: [
                        Image.network(imageUrl),
                        Text(message),
                      ],
                    )),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment:
                isComming ? MainAxisAlignment.start : MainAxisAlignment.end,
            children: [
              isComming
                  ? Text(
                      time,
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  : Row(
                      children: [
                        Text(
                          time,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        SizedBox(width: 10),
                        SvgPicture.asset(
                          AssetsImage.chatStatusSvg,
                          width: 20,
                        )
                      ],
                    ),
            ],
          )
        ],
      ),
    );
  }
}
