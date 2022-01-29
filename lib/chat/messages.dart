// ignore_for_file: use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/chat/message_bubble.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final documents = snapshot.data.docs;
        return ListView.builder(
          reverse: true,
          itemBuilder: (context, index) => MessageBubble(
            message: documents[index]['Text'],
          ),
          // itemBuilder: (context, index) => Container(
          //   padding: const EdgeInsets.all(8),
          //   child: Text(documents[index]['Text']),
          // ),
          itemCount: documents.length,
        );
      },
    );
  }
}
