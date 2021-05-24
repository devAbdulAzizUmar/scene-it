import 'dart:io';

import 'package:first_app/Screens/AddPost/add-post-screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImageScreen extends StatefulWidget {
  static const routeName = "PickImageScreen";

  @override
  _PickImageScreenState createState() => _PickImageScreenState();
}

class _PickImageScreenState extends State<PickImageScreen> {
  File image;
  ImagePicker picker = ImagePicker();

  getImageFromGallery() async {
    PickedFile galleryImage =
        await picker.getImage(source: ImageSource.gallery);
    if (galleryImage == null) {
      Navigator.pop(context);
    } else {
      setState(() {
        image = File(galleryImage.path);
      });
    }
  }

  getImageFromCamera() async {
    PickedFile cameraImage = await picker.getImage(source: ImageSource.camera);
    if (cameraImage == null) {
      Navigator.pop(context);
    } else {
      setState(() {
        image = File(cameraImage.path);
      });
    }
  }

  Source imageSource;

  bool isInit = true;
  @override
  void didChangeDependencies() {
    if (isInit) {
      isInit = false;
      imageSource = ModalRoute.of(context).settings.arguments as Source;
      imageSource == Source.camera
          ? getImageFromCamera()
          : getImageFromGallery();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add an Image"),
        ),
        body: Center(
          child: image == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("No image selected."),
                    TextButton(
                      onPressed: () {
                        imageSource == Source.camera
                            ? getImageFromCamera()
                            : getImageFromGallery();
                      },
                      child: Text(
                        "Try again",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              : Image.file(image),
        ));
  }
}
