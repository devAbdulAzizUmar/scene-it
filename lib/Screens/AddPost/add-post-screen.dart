import 'dart:io';

import 'package:first_app/Util/api.dart';
import 'package:first_app/Util/form-validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

enum Source {
  camera,
  gallery,
}

class AddPostScreen extends StatefulWidget {
  static const routeName = "AddPostScreen";

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> with FormValidation {
  int _currentStep = 0;
  String title = '';
  String location = '';
  String description = '';
  File image;
  bool isLoading = false;
  String loadingText = '';
  String imageUrl = '';
  String price = '';
  String tags = '';

  @override
  Widget build(BuildContext context) {
    // print("Current step: $_currentStep");
    final mediaQuery = MediaQuery.of(context);

    AppBar appBar = AppBar(
      title: Text("Sell Your Item"),
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          height: mediaQuery.size.height,
          child: isLoading
              ? Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator.adaptive(),
                      SizedBox(
                        width: 10,
                      ),
                      Text(loadingText),
                    ],
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Form(
                        child: Stepper(
                          physics: NeverScrollableScrollPhysics(),
                          steps: steps(),
                          type: StepperType.vertical,
                          currentStep: _currentStep,
                          onStepTapped: allowContinue() ? _setStep : null,
                          onStepContinue: allowContinue() ? _continue : null,
                          onStepCancel: _cancel,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    image == null
                        ? Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text("No image selected."),
                            ),
                          )
                        : Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    bottom: 10,
                                    top: 10,
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                  child: Image.file(image),
                                ),
                                Positioned(
                                    top: 5,
                                    right: 5,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                      ),
                                      color: Colors.red,
                                      onPressed: () {
                                        setState(() {
                                          image = null;
                                        });
                                      },
                                    ))
                              ],
                            ),
                          ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
        ),
      ),
    );
  }

///////////////////////////////////////////////////

  void _cancel() {
    if (_currentStep == 0) {
      Navigator.pop(context);
    } else {
      setState(() {
        _currentStep = 0;
      });
    }
  }

  void _setStep(int currentStep) {
    setState(
      () {
        _currentStep = currentStep;
      },
    );
  }

  void submit() async {
    if (image != null) {
      String signedUrl = '';
      setState(() {
        isLoading = true;
        loadingText = "Getting url...";
      });

      try {
        signedUrl = await API.getSignedUrl();

        setState(
          () {
            loadingText = "Uploading image...";
          },
        );
        await API.uploadImage(
          signedUrl: signedUrl,
          image: image.readAsBytesSync(),
        );
        setState(
          () {
            loadingText = "adding post...";
          },
        );

        String imageUrl = '${signedUrl.split("jpg")[0]}jpg';
        await API.uploadPost(
          title: title,
          description: description,
          location: location,
          imageUrls: [imageUrl],
          price: price,
          tags: tags,
        );
        setState(
          () {
            isLoading = false;
            loadingText = "'adding post...'";
          },
        );
      } catch (e) {
        print(e);
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void _continue() {
    if (_currentStep == steps().length - 1) {
      submit();

      print("Submit!");
    }
    if (_currentStep < steps().length - 1) {
      setState(() {
        _currentStep++;
      });
    }
  }

  List<Step> steps() {
    return [
      Step(
        title: Text("Title"),
        content: TextFormField(
          autovalidateMode: AutovalidateMode.always,
          validator: validatePostTitle,
          onChanged: (value) {
            setState(() {
              title = value;
            });
          },
        ),
        isActive: _currentStep == 0,
        state: _currentStep == 0
            ? StepState.editing
            : validatePostTitle(title) == null
                ? StepState.complete
                : StepState.indexed,
      ),
      Step(
        title: Text("Location"),
        content: TextFormField(
          onChanged: (value) {
            location = value;
          },
        ),
        isActive: _currentStep == 1,
        state: _currentStep == 1 ? StepState.editing : StepState.complete,
      ),
      Step(
        title: Text("Tags (separate by commas)"),
        content: TextFormField(
          onChanged: (value) {
            tags = value;
          },
        ),
        isActive: _currentStep == 2,
        state: _currentStep == 2 ? StepState.editing : StepState.complete,
      ),
      Step(
        title: Text("Description"),
        content: TextFormField(
          autovalidateMode: AutovalidateMode.always,
          validator: validatePostDescription,
          onChanged: (value) {
            setState(() {
              description = value;
            });
          },
        ),
        isActive: _currentStep == 3,
        state: _currentStep == 3
            ? StepState.editing
            : validatePostDescription(description) == null
                ? StepState.complete
                : StepState.indexed,
      ),
      Step(
        title: Text("Price"),
        content: TextFormField(
          autovalidateMode: AutovalidateMode.always,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: (value) {
            setState(() {
              price = value;
            });
          },
        ),
        isActive: _currentStep == 4,
        state: _currentStep == 4
            ? StepState.editing
            : validatePostDescription(description) == null
                ? StepState.complete
                : StepState.indexed,
      ),
      Step(
        title: Text("Add Image (optional)"),
        content: Container(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                color: Colors.grey[300],
                child: InkWell(
                  onTap: () {
                    getImage(ImageSource.camera);
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt_outlined,
                          size: 35,
                        ),
                        Text(
                          "Camera",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.grey[300],
                child: InkWell(
                  onTap: () {
                    getImage(ImageSource.gallery);
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image_outlined,
                          size: 35,
                        ),
                        Text(
                          "Gallery",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        isActive: _currentStep == 3,
        state: _currentStep == 3
            ? StepState.editing
            : validatePostDescription(description) == null
                ? StepState.complete
                : StepState.indexed,
      ),
    ];
  }

  bool allowContinue() {
    if (_currentStep == 0) {
      return validatePostTitle(title) != null ? false : true;
    } else if (_currentStep == 3) {
      return validatePostDescription(description) != null ? false : true;
    } else
      return true;
  }

  getImage(ImageSource source) async {
    ImagePicker picker = ImagePicker();

    PickedFile galleryImage = await picker.getImage(source: source).whenComplete(() {
      print("complete");
    }).onError((_, __) {
      print("error");
    });

    if (galleryImage == null) {
      print("Fail");
    } else {
      setState(() {
        print("set image");
        image = File(galleryImage.path);
      });
    }
  }
}
