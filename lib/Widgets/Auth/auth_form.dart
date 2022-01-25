// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({
    Key key,
  }) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email address',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Username'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  SizedBox(height: 12),
                  RaisedButton(
                    onPressed: () {},
                    child: Text('Login'),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text('Create new account'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
