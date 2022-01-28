// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, missing_required_param

import 'package:chat_app/chat/messages.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Chat'),
        actions: <Widget>[
          DropdownButton(
            onChanged: (itemIdentifier) {
              if (itemIdentifier == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            },
            items: [
              DropdownMenuItem(
                  value: 'logout',
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Icon(Icons.exit_to_app, color: Colors.black),
                          const SizedBox(width: 8),
                          const Text('LOGOUT')
                        ],
                      ),
                    ],
                  ))
            ],
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Messages(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // FirebaseFirestore.instance
          //     .collection('chat/Px4D60jBaTTsIf1WEFFf/Messages')
          //     .add({
          //   'Text': 'Added by clicking',
          // });
        },
      ),
    );
  }
}
