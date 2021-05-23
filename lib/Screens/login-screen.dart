import 'package:first_app/Models/user.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:first_app/Screens/ads-overview-screen.dart';

import './signup-screen.dart';

import '../Util/api.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "loginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // ===========================================================================
  //VARIABLES
  // ===========================================================================
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isPassObscured = true;
  bool _remember = false;
  bool _isLoading = false;
  final storage = FlutterSecureStorage();
  String _token;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // ===========================================================================
  // TOGGLE OBSCURED
  // ===========================================================================

  void _toggleObscured() {
    setState(() {
      _isPassObscured = !_isPassObscured;
    });
  }
  // ===========================================================================
  // LOGIN METHOD
  // ===========================================================================

  void _login(String username, String password) async {
    setState(() {
      _isLoading = true;
    });
    try {
      final response = await API.login(username, password);

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        _token = responseBody["token"];
        CurrentUser.token = _token;
        CurrentUser.firstName = responseBody["user"]["firstName"];
        CurrentUser.lastName = responseBody["user"]["lastName"];
        CurrentUser.userName = responseBody["user"]["username"];
        CurrentUser.email = responseBody["user"]["email"];
        CurrentUser.mobileNumber = responseBody["user"]["mobileNumber"];
        CurrentUser.id = responseBody["user"]["id"];

        await storage.write(key: "token", value: _token);

        print(jsonDecode(response.body));

        if (_remember) {
          await storage.write(key: "token", value: _token);
        }

        Navigator.of(context).pushReplacementNamed(AdsOverviewScreen.routeName);
        setState(() {
          _isLoading = false;
        });
        print(_token);
      } else if (response.statusCode == 400) {
        setState(() {
          _isLoading = false;
        });
        print(response.body);

        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Incorrect username or password"),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        setState(() {
          _isLoading = false;
        });
        print(response.body);
        print("its here");
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Unexpected Error!"),
          backgroundColor: Colors.red,
        ));
      }
    } on SocketException {
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Connection failed."),
        backgroundColor: Colors.red,
      ));
    }
  }

  // ===========================================================================
  // BUILD METHOD
  // ===========================================================================
  //
  @override
  void initState() {
    _usernameController.text = "therealaziz";
    _passwordController.text = "randompassword3";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      key: scaffoldKey,
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Center(
            child: Card(
          elevation: 8,
          child: Container(
            height: 300,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller: _usernameController,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please enter a username.";
                              } else if (value.length < 7) {
                                return "Username must be greater than 6";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "Username",
                              labelText: "Username",
                              icon: Icon(Icons.email),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please enter a password.";
                              } else
                                return null;
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _remember = !_remember;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: _remember,
                                        onChanged: (_) {
                                          setState(() {
                                            _remember = !_remember;
                                          });
                                        }),
                                    Text(
                                      "Remember me",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.cyan[900]),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                child: Text(
                                  "Forgot password?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.cyan[900]),
                                ),
                                onTap: () {},
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text("Don't have an account?"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  InkWell(
                                    child: Text(
                                      "Signup",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        SignupScreen.routeName,
                                      );
                                    },
                                  ),
                                ],
                              ),
                              mediaQuery.size.width >= 380
                                  ? RaisedButton(
                                      color: Colors.blue,
                                      onPressed: () {
                                        _login(_usernameController.text.trim(),
                                            _passwordController.text.trim());
                                      },
                                      child: RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            letterSpacing: 0.8,
                                          ),
                                          text: "Login",
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                          mediaQuery.size.width <= 380
                              ? RaisedButton(
                                  color: Colors.blue,
                                  onPressed: () {
                                    _login(_usernameController.text.trim(),
                                        _passwordController.text.trim());
                                  },
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Theme.of(context).cardColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        letterSpacing: 0.8,
                                      ),
                                      text: "Login",
                                    ),
                                  ),
                                )
                              : Container(),
                        ]),
                  ),
          ),
        )),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue[600].withOpacity(0.7),
              Colors.blue[900].withOpacity(0.6)
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ),
    );
  }
}
