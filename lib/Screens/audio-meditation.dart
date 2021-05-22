import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'ads-overview-screen.dart';

class AudioMeditation extends StatefulWidget {
  static String routeName = "AudioMeditation";
  @override
  _AudioMeditationState createState() => _AudioMeditationState();
}

class _AudioMeditationState extends State<AudioMeditation> {
  @override
  Widget build(BuildContext context) {
    String selectedImg;
    //  String selectTitle;
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    selectedImg = arguments['image'];
    //selectTitle = arguments['title'];
    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      appBar: AppBar(
        title: Text('Mental Health', style: TextStyle(fontSize: 30)),
        backgroundColor: Color(0xff276ff7),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.43,
            width: MediaQuery.of(context).size.width,
            color: Color(0xff5b92fa),
            child: Container(
              margin: EdgeInsets.only(right: 40, top: 20, bottom: 20),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/path.png'),
                      fit: BoxFit.contain)),
            ),
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 90,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Let\'s release some stress by listening to some audio meditation!',
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    margin: EdgeInsets.only(right: 20),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(40)),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.search,
                                          size: 30,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: TextField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'Search',
                                                hintStyle: TextStyle(
                                                  fontSize: 20,
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(70),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/$selectedImg.png'),
                                        fit: BoxFit.contain)),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 85,
                        ),
                        Container(
                          // width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  sessionWidget('Meditation 1', false),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  sessionWidget('Meditation 2', false),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  sessionWidget('Meditation 3', false),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  sessionWidget('Meditation 4', false),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  sessionWidget('Meditation 5', false),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  sessionWidget('Meditation 6', false),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                color: Color(0xff276ff7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        FaIcon(
                          FontAwesomeIcons.user,
                          color: Colors.white,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 20),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        FaIcon(
                          FontAwesomeIcons.home,
                          color: Colors.white,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacementNamed(
                                AdsOverviewScreen.routeName);
                          },
                          child: Text(
                            'Home',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget sessionWidget(String title, bool activeOrNot) {
    return Container(
      width: (MediaQuery.of(context).size.width / 2) - 20,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 15,
                spreadRadius: 1)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            (activeOrNot == true)
                ? Icons.play_circle_filled
                : Icons.play_circle_outline,
            color: Color(0xff276ff7),
            size: 30,
          ),
          Text(
            '$title',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
