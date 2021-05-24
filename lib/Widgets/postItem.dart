import 'package:first_app/Screens/ad-detail-screen.dart';
import 'package:first_app/Screens/chat-screen.dart';
import 'package:first_app/Screens/user-screen.dart';
import 'package:first_app/Widgets/expandable-text.dart';
import 'package:flutter/material.dart';

enum CurrentScreen {
  userScreen,
  overviewScreen,
}

class PostItem extends StatelessWidget {
  final CurrentScreen currentScreen;
  final String postID;
  final String username;
  final String userId;
  final String title;
  final String body;
  final List<dynamic> imageUrls;
  final String postTime;
  PostItem({
    this.currentScreen,
    this.postID,
    this.username,
    this.userId,
    this.title,
    this.body,
    this.imageUrls,
    this.postTime,
  });

  void navigateToDetailScreen(BuildContext context, String title) {
    Navigator.of(context)
        .pushNamed(AdDetailsScreen.routeName, arguments: title);
  }

  @override
  Widget build(BuildContext context) {

    String avatarString = '';
    if (username == "AbdulAziz") {
      avatarString = 'assets/aziz.jpeg';
    } else if (username == 'Karishma') {
      avatarString = 'assets/karishma.jpeg';
    } else if (username == 'Ali Mujtaba') {
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
                    navigateToDetailScreen(context, postID);
                  },
                  leading: InkWell(
                    onTap: currentScreen == CurrentScreen.userScreen
                        ? () {}
                        : () {
                            Navigator.of(context).pushNamed(
                                UserScreen.routeName,
                                arguments: username);
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
                    title,
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
                        Text("39.99",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ],
                    ),
                  ),
                  subtitle: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(UserScreen.routeName, arguments: username);
                    },
                    child: Text(
                      username,
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
                  postTime,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 13,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  navigateToDetailScreen(context, postID);
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.topLeft,
                    child: ExpandableText(
                      body: body,
                    )),
              ),
              Container(
                height: imageUrls.isEmpty ? 0 : 10,
              ),
              imageUrls.isEmpty
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
                height: imageUrls.isEmpty ? 0 : 10,
              ),
              imageUrls.isEmpty
                  ? Container()
                  : InkWell(
                      onTap: () {
                        navigateToDetailScreen(context, postID);
                      },
                      child: Container(
                        height: imageUrls.length > 3
                            ? MediaQuery.of(context).size.width / 3
                            : MediaQuery.of(context).size.width /
                                    imageUrls.length -
                                5,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: imageUrls.length > 3
                                ? [
                                    Image.network(
                                      imageUrls[0],
                                      height:
                                          MediaQuery.of(context).size.width /
                                                  3 -
                                              5,
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width /
                                              3 -
                                          5,
                                    ),
                                    Image.network(
                                      imageUrls[1],
                                      height:
                                          MediaQuery.of(context).size.width /
                                                  3 -
                                              5,
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width /
                                              3 -
                                          5,
                                    ),
                                    Stack(
                                      children: [
                                        Image.network(
                                          imageUrls[2],
                                          height: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3 -
                                              5,
                                          fit: BoxFit.cover,
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3 -
                                              5,
                                        ),
                                        Container(
                                          child: Center(
                                            child: Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                color: Colors.black54,
                                              ),
                                              child: Text(
                                                "+ ${imageUrls.length - 2} more...",
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
                                          height: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3 -
                                              5,
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3 -
                                              5,
                                        ),
                                      ],
                                    ),
                                  ]
                                : imageUrls.map((image) {
                                    return Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      height:
                                          MediaQuery.of(context).size.width /
                                                  imageUrls.length -
                                              5,
                                      width: MediaQuery.of(context).size.width /
                                          imageUrls.length,
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
                        icon: Icon(Icons.thumb_up_alt_outlined),
                        onPressed: () {}),
                    makeBottomButton(
                      title: "Comment",
                      icon: Icon(Icons.comment_bank_outlined),
                      onPressed: () {},
                    ),
                    makeBottomButton(
                      title: "Contact",
                      icon: Icon(Icons.call_outlined),
                      onPressed: () {
                        navigateToChatScreen(username, userId, context);
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

navigateToChatScreen(
    String recipientName, String recipientId, BuildContext context) {
  Navigator.of(context).pushNamed(ChatScreen.routeName, arguments: {
    "recipientId": recipientId,
    "recipientName": recipientName,
  });
}
