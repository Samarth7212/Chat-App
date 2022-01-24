// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Screen'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.all(8),
          child: const Text('ABCD'),
        ),
        itemCount: 10,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          FirebaseFirestore.instance
              .collection('chats/yWtiwcFzu0niyn09txoy/Messages')
              .snapshots()
              .listen((data) {
            // print(data.docs.length);
            // print(data.docs.first['Text']);
            data.docs.forEach((element) {
              print(element['Text']);
            });
          });
        },
      ),
    );
  }
}
