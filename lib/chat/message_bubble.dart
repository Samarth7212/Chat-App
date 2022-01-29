// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  const MessageBubble({this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Text(
            message,
            style: TextStyle(color: Theme.of(context).colorScheme.background),
          ),
          width: 180,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12)),
        ),
      ],
    );
  }
}
