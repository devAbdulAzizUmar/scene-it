import 'dart:convert';

import 'package:first_app/Models/user.dart';
import 'package:first_app/Util/api.dart';
import 'package:flutter/material.dart';

class CommentsScreen extends StatefulWidget {
  static const routeName = "CommentsScreen";

  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  List<dynamic> comments;
  bool isLoading = false;
  String postId;
  String comment = "";

  @override
  void didChangeDependencies() async {
    postId = ModalRoute.of(context).settings.arguments as String;
    setState(() {
      isLoading = true;
    });
    final response = await API.getComments(postId: postId);
    comments = jsonDecode(response.body);
    print(comments);
    setState(() {
      isLoading = false;
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Comments"),
            actions: [
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  final response = await API.getComments(postId: postId);

                  setState(() {
                    comments = jsonDecode(response.body);
                    isLoading = false;
                  });
                },
              )
            ],
          ),
          body: isLoading
              ? Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : buildCommentsBody()),
    );
  }

  Widget buildCommentsBody() {
    return comments.length == 0
        ? Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("No comments"),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          comment = value;
                        },
                        decoration: InputDecoration(labelText: "Enter Comment"),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.send,
                        color: Colors.blue,
                      ),
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        final response = await API.addComment(
                          userId: CurrentUser.id,
                          postId: postId,
                          comment: comment,
                        );
                        setState(() {
                          isLoading = false;
                        });
                        if (response.statusCode == 200) {
                          final response = await API.getComments(postId: postId);
                          setState(() {
                            comments = jsonDecode(response.body);
                            print(comments.length);
                          });
                        }
                      },
                    )
                  ],
                )
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: comments.map((comment) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(bottom: 10),
                        color: Colors.blueGrey.shade100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              comment["username"],
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              comment["body"] == null ? "Test" : comment["body"],
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          comment = value;
                        },
                        decoration: InputDecoration(labelText: "Enter Comment"),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.send,
                        color: Colors.blue,
                      ),
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        final response = await API.addComment(
                          userId: CurrentUser.id,
                          postId: postId,
                          comment: comment,
                        );
                        setState(() {
                          isLoading = false;
                        });
                        if (response.statusCode == 200) {
                          final response = await API.getComments(postId: postId);
                          setState(() {
                            comments = jsonDecode(response.body);
                            print(comments.length);
                          });
                        }
                      },
                    )
                  ],
                ),
              ],
            ),
          );
  }
}
