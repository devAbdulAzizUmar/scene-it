import 'package:first_app/Models/user.dart';
import 'package:first_app/Screens/RecommendationsScreen.dart';
import 'package:first_app/Screens/ads-overview-screen.dart';
import 'package:first_app/Screens/login-screen.dart';
import 'package:first_app/Screens/mind-home.dart';
import 'package:first_app/Widgets/AdaptiveList/adaptiveListItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue[800], Colors.blue.withOpacity(0.9)],
                  ),
                ),
                padding: EdgeInsets.only(top: 30),
                child: Center(
                  child: ListTile(
                    onTap: () {},
                    title: Text(
                      CurrentUser.firstName.isEmpty
                          ? ""
                          : CurrentUser.firstName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      CurrentUser.email.isEmpty ? "" : CurrentUser.email,
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: CircleAvatar(
                      child: Icon(Icons.person),
                      backgroundColor: Colors.purple[900],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              AdaptiveListItem(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(AdsOverviewScreen.routeName);
                },
                leading: Icon(
                  Icons.store,
                  size: 45,
                  color: Colors.purple[900],
                ),
                title: Text(
                  "Store",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              AdaptiveListItem(
                leading: Image.asset(
                  "assets/brain.png",
                  color: Colors.purple[900],
                ),
                title: Text(
                  "Mind",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(MindHomePage.routeName);
                },
              ),
              SizedBox(
                height: 10,
              ),
              AdaptiveListItem(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(RecommendationsScreen.routeName);
                },
                leading: Icon(
                  CupertinoIcons.heart,
                  size: 45,
                  color: Colors.purple[900],
                ),
                title: FittedBox(
                  child: Text(
                    "Recommend Me",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: ListTile(
              onTap: () async {
                Navigator.of(context)
                    .pushReplacementNamed(LoginScreen.routeName);
              },
              leading: Icon(
                Icons.logout,
                size: 45,
                color: Colors.purple[900],
              ),
              title: Text(
                "Log out",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          )
        ],
      ),
    );
  }
}
