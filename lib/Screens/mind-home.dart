import 'package:first_app/Models/user.dart';
import 'package:first_app/Screens/Mentalhealth.dart';
import 'package:flutter/material.dart';

import 'Motivationalquotes.dart';

class MindHomePage extends StatefulWidget {
  static String routeName = "MediationHome";
  @override
  _MeditationhomeState createState() => _MeditationhomeState();
}

class _MeditationhomeState extends State<MindHomePage> {
  final String username = CurrentUser.firstName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meditation"),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.white),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///*Main Heading*///////
              Text(
                "Welcome,",
                style: TextStyle(color: Colors.black, fontSize: 35),
              ),
              Container(
                height: 20,
              ),
//////*Second Heading*///////
              Text(
                username == null ? "Username" : username,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),

              Container(
                height: 80,
              ),

/////* Padding Container*////////
              Container(
                height: 250,
                width: 300,
                padding: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
///////*Second Column for Buttons*/////

                child: Column(
                  children: [
                    Container(
                      height: 70,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, Motivationalquotes.routeName);
                      },
                      child: Text(
                        "Motivational Quotes",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Mentalhealth.routeName);
                      },
                      child: Text(
                        "Mental Health",
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
