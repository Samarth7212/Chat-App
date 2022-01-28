// ignore_for_file: use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('chat').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final documents = snapshot.data.docs;
        return ListView.builder(
          itemBuilder: (context, index) => Container(
            padding: const EdgeInsets.all(8),
            child: Text(documents[index]['Text']),
          ),
          itemCount: documents.length,
        );
      },
    );
  }
}
