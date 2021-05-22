import 'package:flutter/material.dart';

class Motivationalquotes extends StatefulWidget {
  static String routeName = "MotivationalQuotes";
  @override
  _MotivationalquotesState createState() => _MotivationalquotesState();
}

class _MotivationalquotesState extends State<Motivationalquotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Motivational Quotes"),
        ),
        body: Container(
            //

            alignment: Alignment.topCenter,
            decoration: BoxDecoration(color: Colors.white54),
            child: Padding(
                padding: EdgeInsets.only(top: 17),
                child: Container(
                    child: Column(children: [
                  Container(
                      padding: EdgeInsets.only(top: 12),
                      alignment: Alignment.center,
                      height: 100,
                      width: 400,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue[300],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.6),
                              spreadRadius: 4,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ]),
                      child: Column(children: [
                        ////Main Heading/////
                        Text(
                          "Motivational Quotes",
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
                        ////Second Text//////
                        Text(
                          "Live happier & healthier with motivation",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 21,
                              color: Colors.white,
                              fontStyle: FontStyle.italic),
                        ),
                      ])),

                  SizedBox(
                    height: 20,
                  ),

                  ///////Quotes Part////////

                  Expanded(
                      child: ListView(children: [
                    //////////First Row/////////
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          /////////////////////first/////////////////////////////
                          Container(
                            alignment: Alignment.center,
                            height: 150,
                            width: 170,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.6),
                                    spreadRadius: 4,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ]),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  /*  CircleAvatar(
                     backgroundImage: AssetImage('assets/qt.jpg'),
                     maxRadius: 30,
                     backgroundColor: Colors.green,
                    ),
                */
                                  SizedBox(
                                    width: 10,
                                  ),
                                  /*  
                   Text("good things take time",
                   style: TextStyle(color: Colors.black,
                   fontSize: 15,
                   fontWeight: FontWeight.bold
                   )),*/
                                ]),
                          ),

                          SizedBox(width: 25),
                          ////////Second//////////////
                          Container(
                            alignment: Alignment.center,
                            height: 150,
                            width: 170,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue[200],
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.6),
                                    spreadRadius: 4,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ]),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  /*  CircleAvatar(
                     backgroundImage: AssetImage('assets/qt.jpg'),
                     maxRadius: 30,
                     backgroundColor: Colors.green,
                    ),
                */
                                  SizedBox(
                                    width: 20,
                                  ),

                                  /*    Text("good things take time",
                   style: TextStyle(color: Colors.black,
                   fontSize: 15,
                   fontWeight: FontWeight.bold
                   )),*/
                                ]),
                          ),
                        ]),

                    SizedBox(height: 20),

                    ///////Second Row///////////////

                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ///////////////////Third//////////////////
                          Container(
                            alignment: Alignment.center,
                            height: 150,
                            width: 170,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue[200],
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.6),
                                    spreadRadius: 4,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ]),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  /*  CircleAvatar(
                     backgroundImage: AssetImage('assets/qt.jpg'),
                     maxRadius: 30,
                     backgroundColor: Colors.green,
                    ),
                */
                                  SizedBox(
                                    width: 10,
                                  ),

                                  /*  Text("good things take time",
                   style: TextStyle(color: Colors.black,
                   fontSize: 15,
                   fontWeight: FontWeight.bold
                   )),*/
                                ]),
                          ),

                          SizedBox(width: 25),
                          /////////////fourth///////////////////
                          Container(
                            alignment: Alignment.center,
                            height: 150,
                            width: 170,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.6),
                                    spreadRadius: 4,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ]),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  /*  CircleAvatar(
                     backgroundImage: AssetImage('assets/qt.jpg'),
                     maxRadius: 30,
                     backgroundColor: Colors.green,
                    ),
                */
                                  SizedBox(
                                    width: 20,
                                  ),

                                  /*  Text("good things take time",
                   style: TextStyle(color: Colors.black,
                   fontSize: 15,
                   fontWeight: FontWeight.bold
                   )),*/
                                ]),
                          ),
                        ]),

                    SizedBox(height: 20),

                    ///////Third Row///////////////

                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ///////////////////fifth//////////////////
                          Container(
                            alignment: Alignment.center,
                            height: 150,
                            width: 170,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.6),
                                    spreadRadius: 4,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ]),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  /*  CircleAvatar(
                     backgroundImage: AssetImage('assets/qt.jpg'),
                     maxRadius: 30,
                     backgroundColor: Colors.green,
                    ),
                */
                                  SizedBox(
                                    width: 10,
                                  ),

                                  /* Text("good things take time",
                   style: TextStyle(color: Colors.black,
                   fontSize: 15,
                   fontWeight: FontWeight.bold
                   )),*/
                                ]),
                          ),

                          SizedBox(width: 25),
                          /////////////Sixth///////////////////
                          Container(
                            alignment: Alignment.center,
                            height: 150,
                            width: 170,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue[200],
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.6),
                                    spreadRadius: 4,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ]),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  /*  CircleAvatar(
                     backgroundImage: AssetImage('assets/qt.jpg'),
                     maxRadius: 30,
                     backgroundColor: Colors.green,
                    ),
                */
                                  SizedBox(
                                    width: 20,
                                  ),

                                  /* Text("good things take time",
                   style: TextStyle(color: Colors.black,
                   fontSize: 15,
                   fontWeight: FontWeight.bold
                   )),*/
                                ]),
                          ),
                        ]),
                    SizedBox(height: 20),

                    ///////Fourth Row///////////////

                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ///////////////////Seventh//////////////////
                          Container(
                            alignment: Alignment.center,
                            height: 150,
                            width: 170,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue[200],
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.6),
                                    spreadRadius: 4,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ]),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  /*  CircleAvatar(
                     backgroundImage: AssetImage('assets/qt.jpg'),
                     maxRadius: 30,
                     backgroundColor: Colors.green,
                    ),
                */
                                  SizedBox(
                                    width: 10,
                                  ),

                                  /* Text("good things take time",
                   style: TextStyle(color: Colors.black,
                   fontSize: 15,
                   fontWeight: FontWeight.bold
                   )),*/
                                ]),
                          ),

                          SizedBox(width: 25),
                          /////////////Eighth///////////////////
                          Container(
                            alignment: Alignment.center,
                            height: 150,
                            width: 170,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.6),
                                    spreadRadius: 4,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ]),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  /*  CircleAvatar(
                     backgroundImage: AssetImage('assets/qt.jpg'),
                     maxRadius: 30,
                     backgroundColor: Colors.green,
                    ),
                */
                                  SizedBox(
                                    width: 20,
                                  ),
                                  /* 
                   Text("good things take time",
                   style: TextStyle(color: Colors.black,
                   fontSize: 15,
                   fontWeight: FontWeight.bold
                   )),*/
                                ]),
                          ),
                        ]),

                    SizedBox(height: 20),

                    ///////Fifth Row///////////////

                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ///////////////////Ninth//////////////////
                          Container(
                            alignment: Alignment.center,
                            height: 150,
                            width: 170,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.6),
                                    spreadRadius: 4,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ]),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  /*  CircleAvatar(
                     backgroundImage: AssetImage('assets/qt.jpg'),
                     maxRadius: 30,
                     backgroundColor: Colors.green,
                    ),
                */
                                  SizedBox(
                                    width: 10,
                                  ),

                                  /* Text("good things take time",
                   style: TextStyle(color: Colors.black,
                   fontSize: 15,
                   fontWeight: FontWeight.bold
                   )),*/
                                ]),
                          ),

                          SizedBox(width: 25),
                          /////////////Tenth///////////////////
                          Container(
                            alignment: Alignment.center,
                            height: 150,
                            width: 170,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue[200],
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.6),
                                    spreadRadius: 4,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ]),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  /*  CircleAvatar(
                     backgroundImage: AssetImage('assets/qt.jpg'),
                     maxRadius: 30,
                     backgroundColor: Colors.green,
                    ),
                */
                                  SizedBox(
                                    width: 20,
                                  ),

                                  /*Text("good things take time",
                   style: TextStyle(color: Colors.black,
                   fontSize: 15,
                   fontWeight: FontWeight.bold
                   )),*/
                                ]),
                          ),
                        ]),

                    SizedBox(height: 20),
                  ]))
                ])))));
  }
}
