// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.all(8),
        child: const Text('ABCD'),
      ),
      itemCount: 10,
    );
  }
}
