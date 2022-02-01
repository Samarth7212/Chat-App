// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, prefer_final_fields, unused_field, unused_element, prefer_const_constructors_in_immutables, use_key_in_widget_constructors
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:chat_app/Widgets/pickers/user_image_picker.dart';

class AuthForm extends StatefulWidget {
  final Function(
    String email,
    String username,
    String password,
    File image,
    bool isLogin,
    BuildContext ctx,
  ) _submitFm;
  bool _isLoading;
  AuthForm(this._submitFm, this._isLoading);
  // final void Function() submitFm;

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
  var _userImageFile;

  var _isLogin = true;

  void _trySubmit() {
    final _isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (_userImageFile == null && !_isLogin) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please pick an image first'),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        duration: Duration(seconds: 3),
      ));
      return;
    }
    if (_isValid) {
      _formKey.currentState.save();
      widget._submitFm(
        _userEmail.trim(),
        _userName.trim(),
        _userPassword.trim(),
        _userImageFile,
        _isLogin,
        context,
      );
    }
  }

  void _pickedImage(File image) {
    _userImageFile = image;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (!_isLogin) UserImagePicker(imagePickFn: _pickedImage),
                  emailTextFormField(),
                  if (!_isLogin) userNameTextFormField(),
                  passwordTextFormField(),
                  SizedBox(height: 12),
                  if (widget._isLoading) CircularProgressIndicator(),
                  if (!widget._isLoading) raisedButton(),
                  if (!widget._isLoading) flatButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  FlatButton flatButton(BuildContext context) {
    return FlatButton(
      onPressed: () {
        setState(() {
          _isLogin = !_isLogin;
        });
      },
      textColor: Theme.of(context).colorScheme.primary,
      child:
          Text(_isLogin ? 'Create new account' : 'I already have an account'),
    );
  }

  RaisedButton raisedButton() {
    return RaisedButton(
      onPressed: _trySubmit,
      child: Text(_isLogin ? 'Login' : 'SignUp'),
    );
  }

  TextFormField emailTextFormField() {
    return TextFormField(
      key: ValueKey('Email'),
      onSaved: (newValue) {
        _userEmail = newValue;
      },
      validator: (value) {
        if (value.isEmpty || !value.contains('@')) {
          return 'Invalid ID';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email address',
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  TextFormField passwordTextFormField() {
    return TextFormField(
      key: ValueKey('Password'),
      onSaved: (newValue) {
        _userPassword = newValue;
      },
      decoration: InputDecoration(labelText: 'Password'),
      obscureText: true,
      validator: (value) {
        if (value.isEmpty || value.length < 7) {
          return 'Password is too short';
        }
        return null;
      },
    );
  }

  TextFormField userNameTextFormField() {
    return TextFormField(
      key: ValueKey('UserName'),
      onSaved: (newValue) {
        _userName = newValue;
      },
      decoration: InputDecoration(labelText: 'Username'),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please provide some name';
        }
        return null;
      },
    );
  }
}
