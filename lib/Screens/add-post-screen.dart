import 'package:first_app/Util/form-validation.dart';
import 'package:flutter/material.dart';

class AddPostScreen extends StatefulWidget {
  static const routeName = "AddPostScreen";

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> with FormValidation {
  int _currentStep = 0;
  String title = '';
  String description = '';

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
                  : StepState.indexed),
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
                  : StepState.indexed),
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
