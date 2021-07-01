import 'package:first_app/Models/audio.dart';
import 'package:first_app/Widgets/audioContainer.dart';
import 'package:first_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MeditationScreen extends StatefulWidget {
  static const String routeName = "MentalHealthScreen";
  @override
  _MeditationScreenState createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  bool isPlaying = false;

  @override
  void initState() {
    if (MyAppState.isAudioPlaying) {
      audios[MyAppState.playingIndex].isPlaying = true;
    }
    super.initState();
  }

  final List<Audio> audios = [
    Audio(
      title: "Powerful Guided",
      image: 'assets/qt.jpg',
      audioAsset: '1.mp3',
      isPlaying: false,
    ),
    Audio(
      title: "Morning Guided",
      image: 'assets/ti.jpg',
      audioAsset: '2.mp3',
      isPlaying: false,
    ),
    Audio(
      title: "Night Guided",
      image: 'assets/dm.png',
      audioAsset: '3.mp3',
      isPlaying: false,
    ),
    Audio(
      title: "In the Light",
      image: 'assets/light.jpg',
      audioAsset: '4.mp3',
      isPlaying: false,
    ),
    Audio(
      title: "In the Moment",
      image: 'assets/moment.jpg',
      audioAsset: '5.mp3',
      isPlaying: false,
    ),
    Audio(
      title: "Eleven Forest",
      image: 'assets/ef.jpg',
      audioAsset: '6.mp3',
      isPlaying: false,
    ),
    Audio(
      title: "Own my own",
      image: 'assets/omo.jpg',
      audioAsset: '7.mp3',
      isPlaying: false,
    ),
    Audio(
      title: "An Ambient Day",
      image: 'assets/ad.jpg',
      audioAsset: '8.mp3',
      isPlaying: false,
    ),
    Audio(
      title: "Peace",
      image: 'assets/peace.jpg',
      audioAsset: '9.mp3',
      isPlaying: false,
    ),
    Audio(
      title: "Mellow Thoughts",
      image: 'assets/mt.jpg',
      audioAsset: '10.mp3',
      isPlaying: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    print("Currently playing index is: ${MyAppState.playingIndex}");
    print("Currently audio is playing: ${MyAppState.isAudioPlaying}");
    void startPlaying(int index) {
      if (!MyAppState.isAudioPlaying) {
        MyAppState.isAudioPlaying = true;
        MyAppState.playingIndex = index;
        MyAppState.cache.play("${index + 1}.mp3");

        setState(() {
          audios[index].isPlaying = true;
        });
      } else {
        if (MyAppState.playingIndex == index) {
          MyAppState.player.pause();
          MyAppState.isAudioPlaying = false;
          setState(() {
            audios[index].isPlaying = false;
          });
        } else {
          setState(() {
            audios[MyAppState.playingIndex].isPlaying = false;
            MyAppState.playingIndex = index;
            audios[index].isPlaying = true;
          });
          MyAppState.player.pause();
          MyAppState.cache.play("${index + 1}.mp3");
        }
      }
    }

    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Meditations"),
      ),
      body: Container(
        height: mediaQuery.size.height,
        width: mediaQuery.size.width,
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(color: Colors.white54),
        child: Padding(
          padding: EdgeInsets.only(top: 17),
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 12),
                  alignment: Alignment.bottomLeft,
                  height: 120,
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [Colors.blue[700], Colors.blue[300]]),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          spreadRadius: 4,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ]),
                  child: Column(
                    children: [
                      Text(
                        "Audio Meditations",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 29,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Let's release some stress by listening to audio meditations!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 21,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: audios.length,
                    itemBuilder: (context, index) {
                      return AudioContainer(
                        audio: audios[index],
                        color: index.isEven ? Colors.blueGrey[400] : Colors.blueGrey[200],
                        startPlaying: () {
                          startPlaying(index);
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
