import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignupScreen extends StatefulWidget {
  static const routeName = "SignupScreen";
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _confirmPasswordKey = GlobalKey<FormState>();
  final validCharacters = RegExp(r'^[a-zA-Z0-9]+$');

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final FocusNode _passwordNode = FocusNode();
  final FocusNode _passwordConfirmNode = FocusNode();
  final FocusNode _phoneNode = FocusNode();

  SnackBar snackBar(String text, Color color) {
    return SnackBar(
      content: Text(text),
      backgroundColor: color,
    );
  }

  bool _isPassObscured = true;
  bool _isPassConfirmedObscured = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordNode.dispose();
    _passwordConfirmNode.dispose();
    _phoneNode.dispose();

    super.dispose();
  }

  void _toggleObscured() {
    setState(() {
      _isPassObscured = !_isPassObscured;
    });
  }

  void _toggleConfirmObscured() {
    setState(() {
      _isPassConfirmedObscured = !_isPassConfirmedObscured;
    });
  }

  String validateName(String value) {
    if (value.isEmpty) {
      return "Please enter a name.";
    } else if (!validCharacters.hasMatch(value)) {
      return "Username must not have spaces or special characters.";
    } else {
      return null;
    }
  }

  String validateFirstName(String value) {
    if (value.isEmpty) {
      return "Enter first name.";
    } else {
      return null;
    }
  }

  String validateLastName(String value) {
    if (value.isEmpty) {
      return "Enter last name.";
    } else {
      return null;
    }
  }

  void submitForm(String firstname, String lastName, String username,
      String email, String password, String phone) {
    http.post(
      Uri.https("http://158.101.169.155:8080", "/posts/getPosts"),
      body: jsonEncode(<String, String>{
        "username": username,
        "firstName": firstname,
        "lastName": lastName,
        "email": email,
        "password": password,
        "mobileNumber": phone,
      }),
      headers: {'Content-Type': 'application/json'},
    ).then((response) {
      if (response.statusCode == 200) {
        print("Account Created!");
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          snackBar("Account Created!", Colors.green),
        );

        Navigator.of(context).pop();
      } else {
        String message = jsonDecode(response.body)['message'];
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          snackBar(message, Colors.red),
        );
      }
    }, onError: (_) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(snackBar("Connection failed.", Colors.red));
    });
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final pageBody = Scaffold(
      appBar: AppBar(
        title: Text("Create Account",
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.cyan[900],
      ),
      key: scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.cyan[900],
              Colors.cyan[900].withOpacity(0.6),
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topRight,
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          alignment: Alignment.center,
          child: Card(
            elevation: 8,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              controller: _firstNameController,
                              textInputAction: TextInputAction.next,
                              validator: validateFirstName,
                              decoration: InputDecoration(
                                hintText: "First name",
                                labelText: "First name",
                                icon: Icon(Icons.people),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Flexible(
                            child: TextFormField(
                              controller: _lastNameController,
                              textInputAction: TextInputAction.next,
                              validator: validateLastName,
                              decoration: InputDecoration(
                                hintText: "Last name",
                                labelText: "Last name",
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 40),
                        child: TextFormField(
                          controller: _usernameController,
                          textInputAction: TextInputAction.next,
                          validator: validateName,
                          decoration: InputDecoration(
                            hintText: "Username",
                            labelText: "Username",
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: _emailController,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          Pattern pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = new RegExp(pattern);
                          if (value.isEmpty) {
                            return "Please enter an email.";
                          } else if (!regex.hasMatch(value)) {
                            return "Invalid email address.";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Email",
                          labelText: "Email",
                          icon: Icon(Icons.email),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        focusNode: _passwordNode,
                        onFieldSubmitted: (_) {
                          _passwordNode.unfocus();
                          FocusScope.of(context)
                              .requestFocus(_passwordConfirmNode);
                        },
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value.length < 8) {
                            return "Password should have at least 8 letters.";
                          } else
                            return null;
                        },
                        onChanged: (value) {
                          _formKey.currentState.validate();
                        },
                        obscureText: _isPassObscured ? true : false,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: "Password",
                          labelText: "Password",
                          icon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(_isPassObscured
                                ? Icons.remove_red_eye
                                : Icons.remove_red_eye_outlined),
                            onPressed: () {
                              _toggleObscured();
                            },
                          ),
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value != _passwordController.text) {
                            return "Passwords don't match.";
                          } else
                            return null;
                        },
                        obscureText: _isPassConfirmedObscured ? true : false,
                        focusNode: _passwordConfirmNode,
                        onFieldSubmitted: (value) {
                          _passwordConfirmNode.unfocus();
                          FocusScope.of(context).requestFocus(_phoneNode);
                        },
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          labelText: "Confirm Password",
                          icon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(_isPassConfirmedObscured
                                ? Icons.remove_red_eye
                                : Icons.remove_red_eye_outlined),
                            onPressed: () {
                              _toggleConfirmObscured();
                            },
                          ),
                        ),
                        key: _confirmPasswordKey,
                        textInputAction: TextInputAction.next,
                        controller: _passwordConfirmController,
                        onChanged: (value) {
                          _formKey.currentState.validate();
                        },
                      ),
                      TextFormField(
                        controller: _phoneController,
                        focusNode: _phoneNode,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          hintText: "Phone",
                          labelText: "Phone",
                          icon: Icon(Icons.phone),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      Divider(
                        height: 5,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 40,
                        width: 200,
                        child: RaisedButton(
                          elevation: 8,

                          // color: Theme.of(context).primaryColorDark,
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              submitForm(
                                  _firstNameController.text.trim(),
                                  _lastNameController.text.trim(),
                                  _usernameController.text.trim(),
                                  _emailController.text.trim(),
                                  _passwordController.text,
                                  _phoneController.text);
                            }
                          },
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                // color: Colors.grey[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: 1.2,
                              ),
                              text: "Create Account",
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    return pageBody;
  }
}
