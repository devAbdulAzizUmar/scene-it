import 'package:audioplayers/audioplayers.dart';
import 'package:first_app/Models/audio.dart';
import 'package:first_app/Widgets/audioContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:audioplayers/audio_cache.dart';

class Mentalhealth extends StatefulWidget {
  static const String routeName = "MentalHealthScreen";
  @override
  _MentalhealthState createState() => _MentalhealthState();
}

class _MentalhealthState extends State<Mentalhealth> {
  AudioPlayer player;
  AudioCache cache;
  bool isPlaying = false;
  IconData playbtn1 = Icons.play_arrow;
  IconData playbtn2 = Icons.play_arrow;
  IconData playbtn3 = Icons.play_arrow;
  IconData playbtn4 = Icons.play_arrow;
  IconData playbtn5 = Icons.play_arrow;
  IconData playbtn6 = Icons.play_arrow;
  IconData playbtn7 = Icons.play_arrow;
  IconData playbtn8 = Icons.play_arrow;
  IconData playbtn9 = Icons.play_arrow;
  IconData playbtn10 = Icons.play_arrow;
  @override
  void initState() {
    // ignore: todo
    //TODO: implement initState
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    player = AudioPlayer();
    cache = AudioCache(fixedPlayer: player);
  }

  final List<Audio> audios = [
    Audio(
      title: "Quiet Time",
      image: 'assets/qt.jpg',
      audioAsset: '1.mp3',
    ),
    Audio(
      title: "Deep Mediatation",
      image: 'assets/dm.png',
      audioAsset: '2.mp3',
    ),
    Audio(
      title: "Time Alone",
      image: 'assets/ti.jpg',
      audioAsset: '3.mp3',
    ),
    Audio(
      title: "In the Light",
      image: 'assets/light.jpg',
      audioAsset: '4.mp3',
    ),
    Audio(
      title: "In the Moment",
      image: 'assets/moment.jpg',
      audioAsset: '5.mp3',
    ),
    Audio(
      title: "Eleven Forest",
      image: 'assets/ef.jpg',
      audioAsset: '6.mp3',
    ),
    Audio(
      title: "Own my own",
      image: 'assets/omo.jpg',
      audioAsset: '7.mp3',
    ),
    Audio(
      title: "An Ambient Day",
      image: 'assets/ad.jpg',
      audioAsset: '8.mp3',
    ),
    Audio(
      title: "Peace",
      image: 'assets/peace.jpg',
      audioAsset: '9.mp3',
    ),
    Audio(
      title: "Mellow Thoughts",
      image: 'assets/mt.jpg',
      audioAsset: '10.mp3',
    ),
  ];

  void startPlaying(int index) {
    if (!isPlaying) {
      cache.play("$index.mp3");
      setState(() {
        playbtn1 = Icons.pause;
        isPlaying = true;
      });
    } else {
      player.pause();
      setState(
        () {
          playbtn1 = Icons.play_arrow;
          isPlaying = false;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mental Health"),
      ),
      body: Container(
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
                      gradient: LinearGradient(colors:[
                    Colors.blue[700],
                    Colors.blue[300]
               ]),
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
                        "Let's release some stress by listening to audio meditation!",
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
                  height: 1,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: audios.length,
                    itemBuilder: (context, index) {
                      return AudioContainer(
                        audio: audios[index],
                        color: index.isEven
                            ? Colors.blueGrey[400]
                            : Colors.blueGrey[200],
                        startPlaying: () {
                          startPlaying(index + 1);
                        },
                      );
                    },
                  ),

//                       child: ListView(
//                         children: [
//                           /////////////////////first/////////////////////////////

//                           Card(
//                             child: Container(
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: 20,
//                                 vertical: 5,
//                               ),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Container(
//                                     width: 60,
//                                     height: 60,
//                                     child: CircleAvatar(
//                                       backgroundImage:
//                                           AssetImage('assets/qt.jpg'),
//                                       maxRadius: 30,
//                                       backgroundColor: Colors.green,
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Text(
//                                       "Quiet Time",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 23,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                   IconButton(
//                                     icon: Icon(
//                                       playbtn1,
//                                     ),
//                                     iconSize: 50,
//                                     color: Colors.black,
//                                     splashColor: Colors.blue[100],
//                                     splashRadius: 40,
//                                     onPressed: () {
//                                       if (!isPlaying) {
//                                         cache.play("1.mp3");
//                                         setState(() {
//                                           playbtn1 = Icons.pause;
//                                           isPlaying = true;
//                                         });
//                                       } else {
//                                         player.pause();
//                                         setState(() {
//                                           playbtn1 = Icons.play_arrow;
//                                           isPlaying = false;
//                                         });
//                                       }
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),

//                           SizedBox(height: 20),
//                           /////////////Second//////////////
//                           Container(
//                             alignment: Alignment.bottomLeft,
//                             height: 70,
//                             width: 350,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: Colors.blue[200],
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.white.withOpacity(0.6),
//                                     spreadRadius: 4,
//                                     blurRadius: 7,
//                                     offset: Offset(0, 3),
//                                   ),
//                                 ]),
//                             child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   SizedBox(
//                                     width: 12,
//                                   ),
//                                   CircleAvatar(
//                                     backgroundImage:
//                                         AssetImage('assets/dm.png'),
//                                     maxRadius: 30,
//                                     backgroundColor: Colors.green,
//                                   ),
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//                                   Text(
//                                     "Deep Mediatation",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 23,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   IconButton(
//                                     icon: Icon(
//                                       playbtn2,
//                                     ),
//                                     iconSize: 50,
//                                     color: Colors.black,
//                                     splashColor: Colors.blue[100],
//                                     splashRadius: 40,
//                                     onPressed: () {
//                                       if (!isPlaying) {
//                                         cache.play("2.mp3");
//                                         setState(() {
//                                           playbtn2 = Icons.pause;
//                                           isPlaying = true;
//                                         });
//                                       } else {
//                                         player.pause();
//                                         setState(() {
//                                           playbtn2 = Icons.play_arrow;
//                                           isPlaying = false;
//                                         });
//                                       }
//                                     },
//                                   ),
//                                 ]),
//                           ),
//                           SizedBox(height: 20),
// //////////////////Third/////////////////////
//                           Container(
//                             alignment: Alignment.bottomLeft,
//                             height: 70,
//                             width: 350,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: Colors.white,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey.withOpacity(0.6),
//                                     spreadRadius: 4,
//                                     blurRadius: 7,
//                                     offset: Offset(0, 3),
//                                   ),
//                                 ]),
//                             child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   //   SizedBox(width: 10,),

//                                   CircleAvatar(
//                                     backgroundImage:
//                                         AssetImage('assets/ti.jpg'),
//                                     maxRadius: 30,
//                                     backgroundColor: Colors.green,
//                                   ),

//                                   Text(
//                                     "Time Alone",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 23,
//                                         fontWeight: FontWeight.bold),
//                                   ),

//                                   IconButton(
//                                     icon: Icon(
//                                       playbtn3,
//                                     ),
//                                     iconSize: 50,
//                                     color: Colors.black,
//                                     splashColor: Colors.blue[100],
//                                     splashRadius: 40,
//                                     onPressed: () {
//                                       if (!isPlaying) {
//                                         cache.play("3.mp3");
//                                         setState(() {
//                                           playbtn3 = Icons.pause;
//                                           isPlaying = true;
//                                         });
//                                       } else {
//                                         player.pause();
//                                         setState(() {
//                                           playbtn3 = Icons.play_arrow;
//                                           isPlaying = false;
//                                         });
//                                       }
//                                     },
//                                   ),
//                                 ]),
//                           ),
//                           //////////Fourth///////////////
//                           SizedBox(height: 20),

//                           Container(
//                             alignment: Alignment.bottomLeft,
//                             height: 70,
//                             width: 350,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: Colors.blue[200],
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.white.withOpacity(0.6),
//                                     spreadRadius: 4,
//                                     blurRadius: 7,
//                                     offset: Offset(0, 3),
//                                   ),
//                                 ]),
//                             child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   CircleAvatar(
//                                     backgroundImage:
//                                         AssetImage('assets/light.jpg'),
//                                     maxRadius: 30,
//                                     backgroundColor: Colors.green,
//                                   ),
//                                   Text(
//                                     "In the Light",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 23,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   IconButton(
//                                     icon: Icon(
//                                       playbtn4,
//                                     ),
//                                     iconSize: 50,
//                                     color: Colors.black,
//                                     splashColor: Colors.blue[100],
//                                     splashRadius: 40,
//                                     onPressed: () {
//                                       if (!isPlaying) {
//                                         cache.play("4.mp3");
//                                         setState(() {
//                                           playbtn4 = Icons.pause;
//                                           isPlaying = true;
//                                         });
//                                       } else {
//                                         player.pause();
//                                         setState(() {
//                                           playbtn4 = Icons.play_arrow;
//                                           isPlaying = false;
//                                         });
//                                       }
//                                     },
//                                   ),
//                                 ]),
//                           ),

//                           ///////////Fift////////////////////////
//                           SizedBox(height: 20),

//                           Container(
//                             alignment: Alignment.bottomLeft,
//                             height: 70,
//                             width: 350,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: Colors.white,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey.withOpacity(0.6),
//                                     spreadRadius: 4,
//                                     blurRadius: 7,
//                                     offset: Offset(0, 3),
//                                   ),
//                                 ]),
//                             child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   SizedBox(
//                                     width: 0,
//                                   ),
//                                   CircleAvatar(
//                                     backgroundImage:
//                                         AssetImage('assets/moment.jpg'),
//                                     maxRadius: 30,
//                                     backgroundColor: Colors.green,
//                                   ),
//                                   SizedBox(
//                                     width: 0,
//                                   ),
//                                   Text(
//                                     "In the Moment",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 23,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   IconButton(
//                                     icon: Icon(
//                                       playbtn5,
//                                     ),
//                                     iconSize: 50,
//                                     color: Colors.black,
//                                     splashColor: Colors.blue[100],
//                                     splashRadius: 40,
//                                     onPressed: () {
//                                       if (!isPlaying) {
//                                         cache.play("5.mp3");
//                                         setState(() {
//                                           playbtn5 = Icons.pause;
//                                           isPlaying = true;
//                                         });
//                                       } else {
//                                         player.pause();
//                                         setState(() {
//                                           playbtn5 = Icons.play_arrow;
//                                           isPlaying = false;
//                                         });
//                                       }
//                                     },
//                                   ),
//                                 ]),
//                           ),
//                           SizedBox(height: 20),
//                           /////////////////////Sixth/////////////////////////////
//                           Container(
//                             alignment: Alignment.bottomLeft,
//                             height: 65,
//                             width: 350,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: Colors.blue[200],
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.white38.withOpacity(0.6),
//                                     spreadRadius: 4,
//                                     blurRadius: 7,
//                                     offset: Offset(0, 3),
//                                   ),
//                                 ]),
//                             child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   SizedBox(width: 0),
//                                   CircleAvatar(
//                                     backgroundImage:
//                                         AssetImage('assets/ef.jpg'),
//                                     maxRadius: 30,
//                                     backgroundColor: Colors.green,
//                                   ),
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//                                   Text(
//                                     "Elven Forest",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 23,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   IconButton(
//                                     icon: Icon(
//                                       playbtn6,
//                                     ),
//                                     iconSize: 50,
//                                     color: Colors.black,
//                                     splashColor: Colors.blue[100],
//                                     splashRadius: 40,
//                                     onPressed: () {
//                                       if (!isPlaying) {
//                                         cache.play("6.mp3");
//                                         setState(() {
//                                           playbtn6 = Icons.pause;
//                                           isPlaying = true;
//                                         });
//                                       } else {
//                                         player.pause();
//                                         setState(() {
//                                           playbtn6 = Icons.play_arrow;
//                                           isPlaying = false;
//                                         });
//                                       }
//                                     },
//                                   ),
//                                 ]),
//                           ),

//                           SizedBox(height: 20),
//                           /////////////////////Seventh/////////////////////////////
//                           Container(
//                             alignment: Alignment.bottomLeft,
//                             height: 65,
//                             width: 350,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: Colors.white,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey.withOpacity(0.6),
//                                     spreadRadius: 4,
//                                     blurRadius: 7,
//                                     offset: Offset(0, 3),
//                                   ),
//                                 ]),
//                             child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   SizedBox(
//                                     width: 0,
//                                   ),
//                                   CircleAvatar(
//                                     backgroundImage:
//                                         AssetImage('assets/omo.jpg'),
//                                     maxRadius: 30,
//                                     backgroundColor: Colors.green,
//                                   ),
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//                                   Text(
//                                     "Own my own",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 23,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   IconButton(
//                                     icon: Icon(
//                                       playbtn7,
//                                     ),
//                                     iconSize: 50,
//                                     color: Colors.black,
//                                     splashColor: Colors.blue[100],
//                                     splashRadius: 40,
//                                     onPressed: () {
//                                       if (!isPlaying) {
//                                         cache.play("1.mp3");
//                                         setState(() {
//                                           playbtn7 = Icons.pause;
//                                           isPlaying = true;
//                                         });
//                                       } else {
//                                         player.pause();
//                                         setState(() {
//                                           playbtn7 = Icons.play_arrow;
//                                           isPlaying = false;
//                                         });
//                                       }
//                                     },
//                                   ),
//                                 ]),
//                           ),

//                           SizedBox(height: 20),
//                           /////////////////////Eight/////////////////////////////
//                           Container(
//                             alignment: Alignment.bottomLeft,
//                             height: 65,
//                             width: 350,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: Colors.blue[200],
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.white.withOpacity(0.6),
//                                     spreadRadius: 4,
//                                     blurRadius: 7,
//                                     offset: Offset(0, 3),
//                                   ),
//                                 ]),
//                             child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   SizedBox(
//                                     width: 30,
//                                   ),
//                                   CircleAvatar(
//                                     backgroundImage:
//                                         AssetImage('assets/ad.jpg'),
//                                     maxRadius: 30,
//                                     backgroundColor: Colors.green,
//                                   ),
//                                   SizedBox(
//                                     width: 25,
//                                   ),
//                                   Text(
//                                     "An Ambient Day ",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 23,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   IconButton(
//                                     icon: Icon(
//                                       playbtn8,
//                                     ),
//                                     iconSize: 50,
//                                     color: Colors.black,
//                                     splashColor: Colors.blue[100],
//                                     splashRadius: 40,
//                                     onPressed: () {
//                                       if (!isPlaying) {
//                                         cache.play("8.mp3");
//                                         setState(() {
//                                           playbtn8 = Icons.pause;
//                                           isPlaying = true;
//                                         });
//                                       } else {
//                                         player.pause();
//                                         setState(() {
//                                           playbtn8 = Icons.play_arrow;
//                                           isPlaying = false;
//                                         });
//                                       }
//                                     },
//                                   ),
//                                 ]),
//                           ),

//                           SizedBox(height: 20),
//                           /////////////////////Ninth/////////////////////////////
//                           Container(
//                             alignment: Alignment.bottomLeft,
//                             height: 65,
//                             width: 350,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: Colors.white,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey.withOpacity(0.6),
//                                     spreadRadius: 4,
//                                     blurRadius: 7,
//                                     offset: Offset(0, 3),
//                                   ),
//                                 ]),
//                             child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   SizedBox(
//                                     width: 20,
//                                   ),
//                                   CircleAvatar(
//                                     backgroundImage:
//                                         AssetImage('assets/peace.jpg'),
//                                     maxRadius: 30,
//                                     backgroundColor: Colors.green,
//                                   ),
//                                   SizedBox(
//                                     width: 50,
//                                   ),
//                                   Text(
//                                     "Peace",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 23,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   SizedBox(
//                                     width: 50,
//                                   ),
//                                   IconButton(
//                                     icon: Icon(
//                                       playbtn9,
//                                     ),
//                                     iconSize: 50,
//                                     color: Colors.black,
//                                     splashColor: Colors.blue[100],
//                                     splashRadius: 40,
//                                     onPressed: () {
//                                       if (!isPlaying) {
//                                         cache.play("9.mp3");
//                                         setState(() {
//                                           playbtn9 = Icons.pause;
//                                           isPlaying = true;
//                                         });
//                                       } else {
//                                         player.pause();
//                                         setState(() {
//                                           playbtn9 = Icons.play_arrow;
//                                           isPlaying = false;
//                                         });
//                                       }
//                                     },
//                                   ),
//                                 ]),
//                           ),

//                           SizedBox(height: 20),
//                           /////////////////////Tenth/////////////////////////////
//                           Container(
//                             alignment: Alignment.bottomLeft,
//                             height: 65,
//                             width: 350,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: Colors.blue[200],
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.white.withOpacity(0.6),
//                                     spreadRadius: 4,
//                                     blurRadius: 7,
//                                     offset: Offset(0, 3),
//                                   ),
//                                 ]),
//                             child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   SizedBox(
//                                     width: 30,
//                                   ),
//                                   CircleAvatar(
//                                     backgroundImage:
//                                         AssetImage('assets/mt.jpg'),
//                                     maxRadius: 30,
//                                     backgroundColor: Colors.green,
//                                   ),
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//                                   Text(
//                                     "Mellow Thoughts",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 23,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   IconButton(
//                                     icon: Icon(
//                                       playbtn10,
//                                     ),
//                                     iconSize: 50,
//                                     color: Colors.black,
//                                     splashColor: Colors.blue[100],
//                                     splashRadius: 40,
//                                     onPressed: () {
//                                       if (!isPlaying) {
//                                         cache.play("10.mp3");
//                                         setState(() {
//                                           playbtn10 = Icons.pause;
//                                           isPlaying = true;
//                                         });
//                                       } else {
//                                         player.pause();
//                                         setState(() {
//                                           playbtn10 = Icons.play_arrow;
//                                           isPlaying = false;
//                                         });
//                                       }
//                                     },
//                                   ),
//                                 ]),
//                           ),
//                           SizedBox(height: 20),
//                         ],
//                       ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
