import 'package:first_app/Models/post.dart';
import 'package:first_app/Widgets/postItem.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  static const routeName = "UserScreen";

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  ScrollController _scrollController = ScrollController();
  var username;
  bool isInit = true;
  bool isLoadingMore = false;
  List<Post> posts = [];
  bool isLoading = true;

  @override
  void didChangeDependencies() {
    if (isInit) {
      username = ModalRoute.of(context).settings.arguments;

      Provider.of<PostsProvider>(context, listen: false)
          .getUserPosts(username: username)
          .then((response) {
        isLoading = false;
      });
      _scrollController.addListener(() {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          setState(() {
            isLoadingMore = true;
          });

          Provider.of<PostsProvider>(context, listen: false)
              .getMoreUserPosts(posts.last.postID, username)
              .then((_) {
            setState(() {
              isLoadingMore = false;
            });
          });
        }
      });

      isInit = false;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    posts = Provider.of<PostsProvider>(context, listen: true).userPosts;

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Center(child: Icon(Icons.person)),
              title: Text(username),
              stretchModes: [StretchMode.blurBackground],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.grey[200],
              alignment: Alignment.centerLeft,
              child: Text(
                "Posts by $username",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (isLoading) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (posts.isEmpty) {
                  return Container(
                    height: 80,
                    child: Center(
                      child: Text("This user has no posts."),
                    ),
                  );
                } else if (index == posts.length) {
                  if (index == posts.length) {
                    return isLoadingMore
                        ? Container(
                            height: 80,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : Container(
                            height: 80,
                            child: Center(
                              child: Text("No more posts."),
                            ),
                          );
                  }
                }
                return PostItem(
                  currentScreen: CurrentScreen.userScreen,
                  title: posts[index].title,
                  userId: posts[index].userID,
                  body: posts[index].body,
                  imageUrls: posts[index].imageUrls.isEmpty
                      ? []
                      : posts[index].imageUrls,
                  postTime: posts[index].postTime,
                  postID: posts[index].postID,
                  username: posts[index].username,
                );
              },
              childCount: posts.length + 1,
            ),
          )
        ],
      ),
    );
  }
}
