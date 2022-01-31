// ignore_for_file: use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/chat/message_bubble.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.value(FirebaseAuth.instance.currentUser),
        builder: (context, futureSnapshot) {
          if (futureSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
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
              // print(documents[0].id);
              return ListView.builder(
                reverse: true,
                itemBuilder: (context, index) => MessageBubble(
                  message: documents[index]['Text'],
                  isMe: documents[index]['userId'] == futureSnapshot.data.uid,
                  userName: documents[index]['userName'],
                  key: ValueKey(documents[index].id),
                ),
                itemCount: documents.length,
              );
            },
          );
        });
  }
}
