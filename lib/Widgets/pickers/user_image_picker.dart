// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final Function(File pickedImage) imagePickFn;
  UserImagePicker({this.imagePickFn});

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File _pickedImage;
  void _pickImage() async {
    final picker = ImagePicker();
    showDialog(
        context: context,
        builder: (context) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextButton.icon(
                  onPressed: () async {
                    final pickedImage =
                        await picker.getImage(source: ImageSource.camera);
                    if (pickedImage != null) {
                      final pickedImageFile = File(pickedImage.path);
                      setState(() {
                        _pickedImage = pickedImageFile;
                      });
                      widget.imagePickFn(pickedImageFile);
                      Navigator.of(context).pop();
                    }
                  },
                  icon: Icon(
                    Icons.camera_rounded,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  label: Text(
                    'Camera',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: () async {
                    final pickedImage =
                        await picker.getImage(source: ImageSource.gallery);
                    if (pickedImage != null) {
                      final pickedImageFile = File(pickedImage.path);
                      setState(() {
                        _pickedImage = pickedImageFile;
                      });
                      widget.imagePickFn(pickedImageFile);
                      Navigator.of(context).pop();
                    }
                  },
                  icon: Icon(
                    Icons.photo_album_rounded,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  label: Text(
                    'Gallery',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          child: _pickedImage == null
              ? Text(
                  '; )',
                  style: TextStyle(fontSize: 55),
                )
              : null,
          backgroundImage:
              _pickedImage != null ? FileImage(_pickedImage) : null,
        ),
        FlatButton.icon(
          onPressed: _pickImage,
          icon: Icon(Icons.image),
          label: Text('Add profile picture'),
          textColor: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }
}
