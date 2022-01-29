// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  Key key;
  MessageBubble({this.message, this.isMe, this.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          child: Text(
            message,
            style: TextStyle(
              color: isMe
                  ? Theme.of(context).colorScheme.background
                  : Colors.black,
            ),
          ),
          width: 180,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
            color: isMe
                ? Theme.of(context).colorScheme.secondary
                : Colors.lightBlueAccent,
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: const Radius.circular(12),
                    topRight: const Radius.circular(12),
                    bottomLeft: !isMe
                        ? const Radius.circular(0)
                        : const Radius.circular(12),
                    bottomRight: isMe
                        ? const Radius.circular(0)
                        : const Radius.circular(12),
                  )
                : BorderRadius.circular(12),
          ),
        ),
      ],
    );
  }
}
