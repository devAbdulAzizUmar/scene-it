import 'package:first_app/Models/user.dart';
import 'package:first_app/Screens/meditation-screen.dart';
import 'package:first_app/Screens/quick-quotes.dart';
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
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Mind"),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient:
                  LinearGradient(colors: [Colors.blue[900], Colors.blue[300]]),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  spreadRadius: 4,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome,",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),

//////*Second Heading*///////
                    Text(
                      username == null ? "Username" : username,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/aziz.jpeg'),
                  maxRadius: 45,
                  backgroundColor: Colors.grey,
                ),
              ],
            ),
          ),

          //////Second Row//////////////
          Row(
            children: [
              ////////////First////////////
              Card(
                child: new InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MeditationScreen(),
                        ));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 300,
                    width: mediaQuery.size.width / 2 - 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          colors: [Colors.grey[700], Colors.blue[300]]),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          spreadRadius: 4,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/mental.jpg'),
                          maxRadius: 75,
                          backgroundColor: Colors.grey,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Meditation",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 27,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              ///////Second/////////////////////////////
              Card(
                child: new InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Motivationalquotes(),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 300,
                    width: mediaQuery.size.width / 2 - 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            colors: [Colors.blue[300], Colors.grey[700]]),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            spreadRadius: 4,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/quotes.jpg'),
                          maxRadius: 75,
                          backgroundColor: Colors.grey,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Motivation",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 27,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, QuickQuotesScreen.routeName);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    Colors.blue[300],
                    Colors.grey[700],
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    spreadRadius: 4,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    child: Image.asset(
                      'assets/quickQuotes.png',
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Quick Quotes",
                        style: TextStyle(
                          color: Colors.grey[100],
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
