// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final String userName;
  final String imageUrl;
  final bool isMe;
  Key key;
  MessageBubble(
      {this.message, this.isMe, this.key, this.userName, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  if (!isMe)
                    Text(
                      userName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  if (isMe)
                    Text(
                      'You',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  Text(
                    message,
                    style: TextStyle(
                      color: isMe
                          ? Theme.of(context).colorScheme.background
                          : Colors.black,
                    ),
                    textAlign: isMe ? TextAlign.end : TextAlign.start,
                  ),
                ],
              ),
              width: 180,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
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
        ),
        Positioned(
          top: 5,
          left: !isMe ? 160 : null,
          right: isMe ? 160 : null,
          child: CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
        ),
      ],
      clipBehavior: Clip.none,
    );
  }
}
