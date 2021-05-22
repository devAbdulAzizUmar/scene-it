import 'package:flutter/material.dart';

class StoryScreen extends StatelessWidget {
  static const routeName = "StoryScreen";
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final arguments =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final String title = arguments['title'];
    final String story = arguments['story'];
    final String image = arguments['storyImage'];
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: mediaQuery.size.width,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                story,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
