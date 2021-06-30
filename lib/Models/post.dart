import 'dart:convert';
import 'package:time_ago_provider/time_ago_provider.dart' as timeAgo;

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../Util/api.dart';

class Post {
  final String postID;
  final String userID;
  final String username;
  final String title;
  final String body;
  final String postTime;
  final List<String> imageUrls;
  final String tags;
  final String price;

  Post({
    this.postID,
    this.userID,
    this.username,
    this.title,
    this.body,
    this.postTime,
    this.imageUrls,
    this.tags,
    this.price = '',
  });
}

class PostsProvider with ChangeNotifier {
  List<Post> _posts = [];
  List<Post> _userPosts = [];
  List<Post> _likedPosts = [];

  List<Post> get likedPosts {
    return [..._likedPosts];
  }

  void addLikedPost(String id) {
    final post = _posts.firstWhere((post) => id == post.postID);
    _likedPosts.add(post);
    notifyListeners();
  }

  final storage = FlutterSecureStorage();

  List<Post> get items {
    return [..._posts];
  }

  List<Post> get userPosts {
    return [..._userPosts];
  }

  void addPost(
      userId, postID, body, username, imageUrls, title, postTime, price, tags) {
    _posts.add(
      Post(
        userID: userId,
        body: body,
        username: username,
        imageUrls: imageUrls,
        title: title,
        postID: postID,
        postTime: postTime,
        price: price,
        tags: tags,
      ),
    );
    notifyListeners();
  }

  void addUserPost(
    userId,
    postID,
    body,
    username,
    imageUrls,
    title,
    postTime,
    price,
    tags,
  ) {
    _userPosts.add(
      Post(
        userID: userId,
        body: body,
        username: username,
        imageUrls: imageUrls,
        title: title,
        postID: postID,
        postTime: postTime,
        price: price,
        tags: tags,
      ),
    );
    notifyListeners();
  }

  Future<void> getInitialPosts() async {
    final response = await API.getPosts();

    final posts = json.decode(
      utf8.decode(response.bodyBytes),
    );
    print(posts);

    List<Post> initialPosts = [];
    initialPosts.clear();
    _posts.clear();
    notifyListeners();

    for (int i = 0; i < posts.length; i++) {
      var timePassed =
          DateTime.fromMillisecondsSinceEpoch(posts[i]["postTime"] * 1000);

      print(timeAgo.format(timePassed));
      initialPosts.add(
        Post(
          userID: posts[i]["userId"],
          postID: posts[i]["id"],
          body: posts[i]["body"],
          username: posts[i]["username"],
          imageUrls: (posts[i]["images"] as List)
              .map((image) => image as String)
              .toList(),
          title: posts[i]["title"],
          postTime: timeAgo.format(timePassed),
          price: posts[i]['country'],
          tags: posts[i]['tagsString'],
        ),
      );
    }

    _posts = [...initialPosts];
    notifyListeners();
  }

  Future<void> getMorePosts(String lastId) async {
    //Fetches ten posts from the server and adds them to the list of posts
    final response = await API.getMorePosts(lastId);
    final posts = json.decode(utf8.decode(response.bodyBytes));

    for (int i = 0; i < posts.length; i++) {
      var timePassed =
          DateTime.fromMillisecondsSinceEpoch(posts[i]["postTime"] * 1000);
      addPost(
        posts[i]["userId"],
        posts[i]["id"],
        posts[i]["body"],
        posts[i]["username"],
        (posts[i]["images"] as List).map((image) => image as String).toList(),
        posts[i]["title"],
        timeAgo.format(timePassed),
        posts[i]['country'],
        posts[i]['tagsString'],
      );
    }
  }

  Future<void> getMoreUserPosts(String lastId, String username) async {
    //Fetches ten posts from the server and adds them to the list of posts
    final response = await API.getMoreUserPosts(lastId, username);

    final posts = json.decode(utf8.decode(response.bodyBytes));

    for (int i = 0; i < posts.length; i++) {
      var timePassed =
          DateTime.fromMillisecondsSinceEpoch(posts[i]["postTime"] * 1000);
      addUserPost(
        posts[i]["userId"],
        posts[i]["id"],
        posts[i]["body"],
        posts[i]["username"],
        (posts[i]["images"] as List).map((image) => image as String).toList(),
        posts[i]["title"],
        timeAgo.format(timePassed),
        posts[i]['country'],
        posts[i]['tagsString'],
      );
      notifyListeners();
    }
  }

  Future<void> getUserPosts({String username}) async {
    _userPosts.clear();
    final response = await API.getUserPosts(username: username);
    final posts = json.decode(utf8.decode(response.bodyBytes));
    for (int i = 0; i < posts.length; i++) {
      var timePassed =
          DateTime.fromMillisecondsSinceEpoch(posts[i]["postTime"] * 1000);
      _userPosts.add(Post(
        postID: posts[i]["id"],
        body: posts[i]["body"],
        username: posts[i]["username"],
        imageUrls: (posts[i]["images"] as List)
            .map((image) => image as String)
            .toList(),
        title: posts[i]["title"],
        postTime: timeAgo.format(timePassed),
        price: posts[i]['country'],
        tags: posts[i]['tagsString'],
      ));
    }
    notifyListeners();
  }

  Post findById(String id) {
    return _posts.firstWhere((post) {
      return post.postID == id;
    });
  }
}
