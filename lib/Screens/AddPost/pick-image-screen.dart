import 'package:first_app/Screens/AddPost/add-post-screen.dart';
import 'package:flutter/material.dart';

class PickImageScreen extends StatelessWidget {
  static const routeName = "PickImageScreen";
  @override
  Widget build(BuildContext context) {
    final ImageSource imageSource = ModalRoute.of(context).settings.arguments;
    print(imageSource);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add an Image"),
      ),
    );
  }
}
