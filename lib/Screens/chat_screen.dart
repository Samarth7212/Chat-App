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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats/yWtiwcFzu0niyn09txoy/Messages')
            .snapshots(),
        builder: (context, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final documents = streamSnapshot.data.docs;
          return ListView.builder(
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.all(8),
              child: Text(documents[index]['Text']),
            ),
            itemCount: documents.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          FirebaseFirestore.instance
              .collection('chats/yWtiwcFzu0niyn09txoy/Messages')
              .add({
                'Text':'Added by clicking',
              });
        },
      ),
    );
  }
}
