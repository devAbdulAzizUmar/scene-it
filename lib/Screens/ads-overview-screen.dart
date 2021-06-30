import 'dart:io';

import 'package:first_app/Models/post.dart';
import 'package:first_app/Screens/AddPost/add-post-screen.dart';

import 'package:first_app/Screens/login-screen.dart';

import 'package:first_app/Widgets/drawer.dart';
import 'package:first_app/Widgets/postItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AdsOverviewScreen extends StatefulWidget {
  static const routeName = "AdsOverviewScreen";

  @override
  _AdsOverviewScreenState createState() => _AdsOverviewScreenState();
}

class _AdsOverviewScreenState extends State<AdsOverviewScreen> {
  List<Post> posts = [];
  List<Post> postsAfterSearch = [];
  final storage = FlutterSecureStorage();
  var isLoading = true;
  bool isInit = true;
  bool isLoadingMore = false;
  bool listHasDoneLoading = true;
  bool firstLoad = true;
  ScrollController _scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    //Loading all posts from the API before rendering the UI
    if (isInit) {
      Provider.of<PostsProvider>(context).getInitialPosts().then((response) {
        setState(() {
          isLoading = false;
        });
      });

      isInit = false;
      _scrollController.addListener(() {
        if ((_scrollController.position.outOfRange || _scrollController.position.atEdge) && listHasDoneLoading) {
          listHasDoneLoading = false;
          Future.delayed(Duration(seconds: 1)).whenComplete(() {
            listHasDoneLoading = true;
          });

          setState(() {
            isLoadingMore = true;
          });

          Provider.of<PostsProvider>(context, listen: false).getMorePosts(posts.last.postID).then((_) {
            setState(() {
              isLoadingMore = false;
            });
          });
        }
      });
    }

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Getting a reference to provider to listen to changes.
    final postsProvider = Provider.of<PostsProvider>(context, listen: true);
    posts = postsProvider.items;

    if (firstLoad) {
      postsAfterSearch = posts;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(AddPostScreen.routeName);
        },
      ),
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width / 2.5,
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                child: Image.asset(
                  "assets/logo.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  "Scene It",
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () async {
                isLoading = true;
                await storage.delete(key: "token").then((value) {
                  setState(() {
                    isLoading = false;
                  });
                });
                Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
              })
        ],
      ),
      body: isLoading
          ? Center(
              child: Platform.isAndroid ? CircularProgressIndicator() : CupertinoActivityIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () {
                return postsProvider.getInitialPosts();
              },
              child: buildList(),
            ),
    );
  }

  Widget buildList() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: postsAfterSearch.length + 2,
      itemBuilder: (context, index) {
        if (index == postsAfterSearch.length + 1) {
          return isLoadingMore
              ? Container(
                  height: 80,
                  color: Colors.white,
                  child: Center(
                    child: Platform.isAndroid ? CircularProgressIndicator() : CupertinoActivityIndicator(),
                  ),
                )
              : Container(
                  height: 80,
                  child: Center(
                    child: Text("No more posts."),
                  ),
                );
        }

        return index == 0 ? _searchBar() : _showPosts(index - 1);
      },
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(hintText: "Search by location"),
        onChanged: (text) {
          setState(() {
            postsAfterSearch = posts.where((post) {
              var searchResult = post.username.toLowerCase();
              return searchResult.contains(text.toLowerCase());
            }).toList();
          });
        },
      ),
    );
  }

  Widget _showPosts(index) {
    var namePostList;

    if (firstLoad == true) {
      namePostList = posts;
      firstLoad = false;
    } else {
      namePostList = postsAfterSearch;
    }

    return PostItem(
      currentScreen: CurrentScreen.overviewScreen,
      title: namePostList[index].title,
      body: namePostList[index].body,
      imageUrls: namePostList[index].imageUrls,
      username: namePostList[index].username,
      userId: namePostList[index].userID,
      postID: namePostList[index].postID,
      postTime: namePostList[index].postTime,
      price: namePostList[index].price,
      tags: namePostList[index].tags,
    );
  }
}
