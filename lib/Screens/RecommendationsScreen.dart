import 'package:first_app/Models/post.dart';
import 'package:first_app/Widgets/postItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecommendationsScreen extends StatelessWidget {
  static const routeName = "RecommendationsScreen";

  @override
  Widget build(BuildContext context) {
    final likedPosts = Provider.of<PostsProvider>(context, listen: false).likedPosts;
    final allPosts = Provider.of<PostsProvider>(context, listen: false).items;
    List<Post> recommendedPosts = [];

    for (int i = 0; i < likedPosts.length; i++) {
      final likedTags = likedPosts[i].tags.split(",");

      for (int j = 0; j < allPosts.length; j++) {
        for (int k = 0; k < likedTags.length; k++) {
          if (allPosts[j].tags.contains(likedTags[k])) {
            recommendedPosts.add(allPosts[j]);
            break;
          }
        }
      }
    }
    for (var i = 0; i < recommendedPosts.length; i++) {
      for (var j = i + 1; j < recommendedPosts.length; j++) {
        if (recommendedPosts[i].postID == recommendedPosts[j].postID) {
          recommendedPosts.removeAt(i);
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Recommendations"),
      ),
      body: ListView.builder(
        itemCount: recommendedPosts.length,
        itemBuilder: (context, index) {
          return PostItem(
            currentScreen: CurrentScreen.overviewScreen,
            title: recommendedPosts[index].title,
            postID: recommendedPosts[index].postID,
            body: recommendedPosts[index].body,
            userId: recommendedPosts[index].userID,
            postTime: recommendedPosts[index].postTime,
            price: recommendedPosts[index].price,
            username: recommendedPosts[index].username,
            imageUrls: recommendedPosts[index].imageUrls,
            tags: recommendedPosts[index].tags,
          );
        },
      ),
    );
  }
}
