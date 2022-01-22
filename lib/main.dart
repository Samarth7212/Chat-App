// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:chat_app/Screens/chat_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Great Places',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
            .copyWith(secondary: Colors.amber),
      ),
      home: ChatScreen(),
    );
  }
}
