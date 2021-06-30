import 'package:first_app/Models/post.dart';
import 'package:first_app/Models/user.dart';
import 'package:first_app/Screens/CommentsScreen.dart';
import 'package:first_app/Screens/ad-detail-screen.dart';
import 'package:first_app/Screens/chat-screen.dart';
import 'package:first_app/Screens/user-screen.dart';
import 'package:first_app/Widgets/expandable-text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum CurrentScreen {
  userScreen,
  overviewScreen,
}

class PostItem extends StatefulWidget {
  final CurrentScreen currentScreen;
  final String postID;
  final String username;
  final String userId;
  final String title;
  final String body;
  final List<dynamic> imageUrls;
  final String postTime;
  final String price;
  final String tags;
  final String location;
  PostItem({
    this.currentScreen,
    this.postID,
    this.username,
    this.userId,
    this.title,
    this.body,
    this.imageUrls,
    this.postTime,
    this.price = '',
    this.tags,
    this.location,
  });

  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  bool isFav = false;

  void navigateToDetailScreen(BuildContext context, String title) {
    Navigator.of(context).pushNamed(AdDetailsScreen.routeName, arguments: title);
  }

  @override
  Widget build(BuildContext context) {
    String avatarString = '';
    if (widget.username == "AbdulAziz") {
      avatarString = 'assets/aziz.jpeg';
    } else if (widget.username == 'Karishma') {
      avatarString = 'assets/karishma.jpeg';
    } else if (widget.username == 'Ali Mujtaba') {
      avatarString = 'assets/ali.jpeg';
    } else {
      avatarString = 'assets/generic.jpg';
    }

    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1, color: Colors.grey[300]),
              top: BorderSide(width: 1, color: Colors.grey[300]),
            ),
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: ListTile(
                  onTap: () {
                    navigateToDetailScreen(context, widget.postID);
                  },
                  leading: InkWell(
                    onTap: widget.currentScreen == CurrentScreen.userScreen
                        ? () {}
                        : () {
                            Navigator.of(context).pushNamed(UserScreen.routeName, arguments: widget.username);
                          },
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.lightBlue,
                      backgroundImage: AssetImage(
                        avatarString,
                      ),
                    ),
                  ),
                  title: Text(
                    widget.title,
                    style: (TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
                  ),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: [
                        Icon(
                          Icons.attach_money,
                          color: Colors.blue,
                        ),
                        Text(
                          widget.price == null ? "" : widget.price,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  subtitle: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(UserScreen.routeName, arguments: widget.username);
                    },
                    child: Text(
                      widget.username,
                      style: (TextStyle(
                        fontSize: 16,
                      )),
                    ),
                  ),
                  contentPadding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 5,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5),
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                alignment: Alignment.topLeft,
                child: Text(
                  widget.postTime,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 13,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  navigateToDetailScreen(context, widget.postID);
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.topLeft,
                    child: ExpandableText(
                      body: widget.body,
                    )),
              ),
              Container(
                height: widget.imageUrls.isEmpty ? 0 : 10,
              ),
              widget.imageUrls.isEmpty
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.grey[300],
                      ),
                    ),
              Container(
                height: widget.imageUrls.isEmpty ? 0 : 10,
              ),
              widget.imageUrls.isEmpty
                  ? Container()
                  : InkWell(
                      onTap: () {
                        navigateToDetailScreen(context, widget.postID);
                      },
                      child: Container(
                        height: widget.imageUrls.length > 3
                            ? MediaQuery.of(context).size.width / 3
                            : MediaQuery.of(context).size.width / widget.imageUrls.length - 5,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: widget.imageUrls.length > 3
                                ? [
                                    Image.network(
                                      widget.imageUrls[0],
                                      height: MediaQuery.of(context).size.width / 3 - 5,
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width / 3 - 5,
                                    ),
                                    Image.network(
                                      widget.imageUrls[1],
                                      height: MediaQuery.of(context).size.width / 3 - 5,
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width / 3 - 5,
                                    ),
                                    Stack(
                                      children: [
                                        Image.network(
                                          widget.imageUrls[2],
                                          height: MediaQuery.of(context).size.width / 3 - 5,
                                          fit: BoxFit.cover,
                                          width: MediaQuery.of(context).size.width / 3 - 5,
                                        ),
                                        Container(
                                          child: Center(
                                            child: Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                color: Colors.black54,
                                              ),
                                              child: Text(
                                                "+ ${widget.imageUrls.length - 2} more...",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.black54,
                                          ),
                                          height: MediaQuery.of(context).size.width / 3 - 5,
                                          width: MediaQuery.of(context).size.width / 3 - 5,
                                        ),
                                      ],
                                    ),
                                  ]
                                : widget.imageUrls.map((image) {
                                    return Container(
                                      padding: EdgeInsets.symmetric(horizontal: 5),
                                      height: MediaQuery.of(context).size.width / widget.imageUrls.length - 5,
                                      width: MediaQuery.of(context).size.width / widget.imageUrls.length,
                                      child: Image.network(
                                        image,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  }).toList()),
                      ),
                    ),
              Container(
                height: 10,
              ),
              if (widget.tags != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Tags: ${widget.tags.replaceAll(",", " ")}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      )),
                ),
              Container(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.grey[300],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    makeBottomButton(
                        title: "Like",
                        icon: Icon(Icons.thumb_up_alt_outlined, color: isFav ? Colors.blue : Colors.grey),
                        onPressed: () {
                          setState(() {
                            isFav = !isFav;
                          });
                          Provider.of<PostsProvider>(context, listen: false).addLikedPost(widget.postID);
                        }),
                    makeBottomButton(
                      title: "Comment",
                      icon: Icon(Icons.comment_bank_outlined),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          CommentsScreen.routeName,
                          arguments: widget.postID,
                        );
                      },
                    ),
                    makeBottomButton(
                      title: "Contact",
                      icon: Icon(Icons.call_outlined),
                      onPressed: () {
                        navigateToChatScreen(widget.username, widget.userId, context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
        )
      ],
    );
  }
}

Widget makeBottomButton({String title, Icon icon, Function onPressed}) {
  return Expanded(
    child: InkWell(
      onTap: onPressed,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: null,
              icon: icon,
              color: Colors.black54,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black54,
              ),
            )
          ],
        ),
      ),
    ),
  );
}

navigateToChatScreen(String recipientName, String recipientId, BuildContext context) {
  Navigator.of(context).pushNamed(ChatScreen.routeName, arguments: {
    "recipientId": recipientId,
    "recipientName": recipientName,
  });
}
