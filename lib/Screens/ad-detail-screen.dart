import 'dart:io';
import 'dart:ui';

import 'package:first_app/Models/post.dart';
import 'package:first_app/Screens/ar-ios-screen.dart';
import 'package:first_app/Screens/ar-screen.dart';
import 'package:first_app/Screens/user-screen.dart';

import 'package:first_app/Widgets/ImageView/imageView.dart';
import 'package:first_app/Widgets/expandable-text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdDetailsScreen extends StatelessWidget {
  static const routeName = "AdDetailsScreen";

  @override
  Widget build(BuildContext context) {
    String avatarString = '';

    final postID = ModalRoute.of(context).settings.arguments;
    final post = Provider.of<PostsProvider>(context).findById(postID);
    if (post.username == "Abdul Aziz") {
      avatarString = 'assets/aziz.jpeg';
    } else if (post.username == 'Karishma') {
      avatarString = 'assets/karishma.jpeg';
    } else if (post.username == 'Ali Mujtaba') {
      avatarString = 'assets/ali.jpeg';
    } else {
      avatarString = 'assets/generic.jpg';
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Post Details"),
      ),
      body: ListView.builder(
        itemCount: post.imageUrls.isEmpty ? 2 : post.imageUrls.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return TopArea(
              post: post,
              avatarString: avatarString,
            );
          } else if (post.imageUrls.isEmpty
              ? index == 1
              : index == (post.imageUrls.length + 2) - 1) {
            return Center(
              heightFactor: 5,
              child: Text("Comment Section"),
            );
          } else {
            return ImageContainer(
              post: post,
              imageUrl: post.imageUrls[index - 1],
              tag: index - 1,
            );
          }
        },
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  final Post post;
  final imageUrl;
  final int tag;
  ImageContainer({
    this.post,
    @required this.imageUrl,
    this.tag,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) {
              return ImageGallery(
                imageCount: post.imageUrls.length,
                imageIndex: tag,
                imageUrls: post.imageUrls,
              );
            },
          ),
        );
      },
      child: Hero(
        tag: tag,
        child: Container(
          margin: const EdgeInsets.only(bottom: 5),
          height: 250,
          width: double.infinity,
          child: FadeInImage.assetNetwork(
            image: imageUrl,
            placeholder: "assets/loading.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class TopArea extends StatelessWidget {
  final avatarString;
  const TopArea({
    @required this.post,
    this.avatarString,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              onTap: () {},
              leading: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(UserScreen.routeName,
                      arguments: post.username);
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
                post.title,
                style: (TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
              ),
              subtitle: InkWell(
                onTap: () {
                  print("User pressed!");
                },
                child: Text(
                  post.username,
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
              post.postTime,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 13,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.topLeft,
                child: ExpandableText(
                  body: post.body,
                  maxLength: 600,
                )),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1, color: Colors.grey[300]),
              ),
            ),
            height: post.imageUrls.isEmpty ? 0 : 10,
          ),
        ],
      ),
    );
  }
}

class ImageGallery extends StatefulWidget {
  final int imageCount;
  final int imageIndex;
  final imageUrls;
  static final routeName = "ImageGallery";

  ImageGallery({
    this.imageUrls,
    this.imageCount,
    this.imageIndex,
  });

  @override
  _ImageGalleryState createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  int arCurrentIndex;
  PageController _pageController;
  @override
  void initState() {
    arCurrentIndex = widget.imageIndex;
    _pageController = PageController(
      initialPage: widget.imageIndex,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
              Platform.isAndroid
                  ? AugmentedRealityScreen.routeName
                  : IOSAugmentedReality.routeName,
              arguments: widget.imageUrls[arCurrentIndex]);
        },
        child: Icon(
          Icons.camera,
          color: Colors.white,
          size: 50,
        ),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        bottomOpacity: 0,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Center(
        child: Container(
          height: 600,
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
            onPageChanged: (index) {
              arCurrentIndex = index;
            },
            itemCount: widget.imageCount,
            controller: _pageController,
            itemBuilder: (context, index) {
              return Draggable(
                onDragEnd: (dragDetails) {
                  print(dragDetails.velocity.pixelsPerSecond);
                  if (dragDetails.velocity.pixelsPerSecond.dy >= 100 ||
                      dragDetails.velocity.pixelsPerSecond.dy <= -100 ||
                      dragDetails.velocity.pixelsPerSecond.dx >= 100 ||
                      dragDetails.velocity.pixelsPerSecond.dx <= -100) {
                    Navigator.of(context).pop();
                  }
                },
                affinity: Axis.vertical,
                maxSimultaneousDrags: 1,
                feedback: Container(
                  alignment: Alignment.center,
                  height: 600,
                  width: MediaQuery.of(context).size.width,
                  child: ImageView(
                    imageUrl: widget.imageUrls[index],
                    tag: index,
                  ),
                ),
                childWhenDragging: Container(),
                child: InteractiveViewer(
                  child: ImageView(
                    imageUrl: widget.imageUrls[index],
                    tag: index,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
