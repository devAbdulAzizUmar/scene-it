import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:first_app/Screens/meditation-screen.dart';
import 'package:first_app/Screens/MotivationalQuotes.dart';
import 'package:first_app/Screens/ad-detail-screen.dart';
import 'package:first_app/Screens/AddPost/add-post-screen.dart';
import 'package:first_app/Screens/ads-overview-screen.dart';
import 'package:first_app/Screens/ar-ios-screen.dart';
import 'package:first_app/Screens/ar-screen.dart';
import 'package:first_app/Screens/chat-screen.dart';
import 'package:first_app/Screens/mind-home.dart';
import 'package:first_app/Screens/quick-quotes.dart';

import 'package:first_app/Screens/story-screen.dart';
import 'package:first_app/Screens/user-screen.dart';
import 'package:first_app/Util/api.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:jwt_decoder/jwt_decoder.dart';

import 'Models/post.dart';

import 'Screens/login-screen.dart';
import 'Screens/signup-screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final storage = FlutterSecureStorage();
  static int playingIndex = 11;
  static bool isAudioPlaying = false;
  static AudioPlayer player;
  static AudioCache cache;

  String _token;
  bool _isLoggedin = false;
  bool _isLoading = true;

  Future<void> loginWithToken(String token) async {
    _token = await storage.read(key: "token");

    if (_token != null && !JwtDecoder.isExpired(_token)) {
      setState(() {
        _isLoggedin = true;
      });
    }
  }

  @override
  void dispose() {
    player.dispose();

    super.dispose();
  }

  @override
  void initState() {
    player = AudioPlayer();
    cache = AudioCache(fixedPlayer: player);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("building main");

    return ChangeNotifierProvider.value(
      value: PostsProvider(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
        // home: _isLoading
        //     ? Center(
        //         child: CircularProgressIndicator(),
        //       )
        //     : _isLoggedin
        //         ? AdsOverviewScreen()
        //         : LoginScreen(),
        debugShowCheckedModeBanner: false,

        routes: {
          SignupScreen.routeName: (context) => SignupScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          AdsOverviewScreen.routeName: (context) => AdsOverviewScreen(),
          AdDetailsScreen.routeName: (context) => AdDetailsScreen(),
          UserScreen.routeName: (context) => UserScreen(),
          AddPostScreen.routeName: (context) => AddPostScreen(),
          AugmentedRealityScreen.routeName: (context) =>
              AugmentedRealityScreen(),
          Motivationalquotes.routeName: (context) => Motivationalquotes(),
          MindHomePage.routeName: (context) => MindHomePage(),
          ChatScreen.routeName: (context) => ChatScreen(),
          IOSAugmentedReality.routeName: (context) => IOSAugmentedReality(),
          MeditationScreen.routeName: (context) => MeditationScreen(),
          StoryScreen.routeName: (context) => StoryScreen(),
          QuickQuotesScreen.routeName: (context) => QuickQuotesScreen(),
        },
      ),
    );
  }
}
