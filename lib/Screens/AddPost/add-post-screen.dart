import 'package:first_app/Screens/AddPost/pick-image-screen.dart';
import 'package:first_app/Util/form-validation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

enum ImageSource {
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
  String description = '';

  void navigateToImagePickerScreen({
    BuildContext context,
    ImageSource imageSource,
  }) {
    Navigator.pushNamed(context, PickImageScreen.routeName,
        arguments: imageSource);
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
        content: TextFormField(),
        isActive: _currentStep == 1,
        state: _currentStep == 1 ? StepState.editing : StepState.complete,
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
        isActive: _currentStep == 2,
        state: _currentStep == 2
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
                    navigateToImagePickerScreen(
                        context: context, imageSource: ImageSource.camera);
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
                    navigateToImagePickerScreen(
                        context: context, imageSource: ImageSource.gallery);
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
    } else if (_currentStep == 2) {
      return validatePostDescription(description) != null ? false : true;
    } else
      return true;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    AppBar appBar = AppBar(
      title: Text("Sell Your Item"),
    );
    return Scaffold(
      appBar: appBar,
      body: Form(
        child: Stepper(
          steps: steps(),
          type: StepperType.vertical,
          currentStep: _currentStep,
          onStepTapped: allowContinue() ? _setStep : null,
          onStepContinue: allowContinue() ? _continue : null,
          onStepCancel: _cancel,
        ),
      ),
    );
  }

  void _cancel() {
    if (_currentStep == 0) {
      Navigator.pop(context);
    } else {
      setState(() {
        _currentStep = 0;
      });
    }
  }

  void _continue() {
    if (_currentStep < steps().length - 1) {
      setState(() {
        _currentStep++;
      });
    }
  }

  void _setStep(int currentStep) {
    setState(() {
      _currentStep = currentStep;
    });
  }
}
