import 'package:first_app/Models/user.dart';
import 'package:first_app/Screens/Mentalhealth.dart';
import 'package:flutter/material.dart';

import 'Motivationalquotes.dart';

class MindHomePage extends StatefulWidget {
  static String routeName = "MediationHome";
  @override
  _MeditationhomeState createState() => _MeditationhomeState();
}

class _MeditationhomeState extends State<MindHomePage> {
  final String username = CurrentUser.firstName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meditation"),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.white),
       child:Column(children: [
         SizedBox(height: 15,),
      Container(
                padding:EdgeInsets.only(top:12),
                   //alignment: Alignment.bottomLeft,
                   height: 140,
                   width: 390,
                   decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),  
                    gradient: LinearGradient(colors:[
                    Colors.blue[900],
                    Colors.blue[300]
               ]),
                  
                   boxShadow:[ BoxShadow(color: Colors.grey.withOpacity(0.6),
                   spreadRadius:4,
                   blurRadius: 7,
                   offset: Offset(0, 3), 
                   
                   
                   ),]
                    
                   ),
          
          child:Column(children: [
           // SizedBox(height: 10),
         
           Row(children: [
           SizedBox(width: 30,),
           // mainAxisAlignment: MainAxisAlignment.center,
           Column(children: [
              ///*Main Heading*///////
             SizedBox(height: 20,),
             
              Text(
                "Welcome,",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              Container(
                height: 15,
              ),
//////*Second Heading*///////
              Text(
                username == null ? "Username" : username,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
                SizedBox(height: 30,),
            ]),
          
            SizedBox(width: 150),
               
               CircleAvatar(
                     backgroundImage: AssetImage('assets/user.png'),
                     maxRadius: 45,
                     backgroundColor: Colors.grey,
                    ),]),
          ]),),

                   SizedBox(height: 40,),
          //////Second Row//////////////          
                  Row(
               mainAxisAlignment:MainAxisAlignment.center,
               children: [
              ////////////First////////////
                     Card(
                     child: new InkWell(
                        onTap: () {
                        Navigator.push( context, MaterialPageRoute(
                         builder: (context) => Mentalhealth(),));},
              child:  Container(
                   alignment: Alignment.center,
                   height: 300,
                   width: 170,
                   decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),  
                    gradient: LinearGradient(colors:[
                    Colors.blue[700],
                    Colors.blue[300]
                    ]),
                   boxShadow:[ BoxShadow(color: Colors.grey.withOpacity(0.6),
                   spreadRadius:4,
                   blurRadius: 7,
                   offset: Offset(0, 3), 
                   ),]),
                   
                   child:Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                     
                    CircleAvatar(
                     backgroundImage: AssetImage('assets/mental.jpg'),
                     maxRadius: 75,
                     backgroundColor: Colors.grey,
                    ),
                    
                    SizedBox(height: 20,),
                   
                   Text("Mental Health",
                   textAlign:TextAlign.center,
                   style: TextStyle(color: Colors.white,
                   fontSize: 27,
                   fontWeight: FontWeight.bold
                   )),
                   
                    SizedBox(height: 10,),
                   
                   ]),), 
  ),
), 
                    SizedBox(width: 20),
                 ///////Second///////////////////////////// 
             Card(
                     child: new InkWell(
                        onTap: () {
                        Navigator.push( context, MaterialPageRoute(
                         builder: (context) => Motivationalquotes(),));},
              child:  Container(
                   alignment: Alignment.center,
                   height: 300,
                   width: 170,
                   decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),  
                   gradient: LinearGradient(colors:[
                    Colors.blue[300],
                    Colors.blue[700]
               ]),
                   boxShadow:[ BoxShadow(color: Colors.grey.withOpacity(0.6),
                   spreadRadius:4,
                   blurRadius: 7,
                   offset: Offset(0, 3), 
                   ),]),
                   
                   child:Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [

                     
                     CircleAvatar(
                     backgroundImage: AssetImage('assets/quotes.jpg'),
                     maxRadius: 75,
                     backgroundColor: Colors.grey,
                    ),
                
                   SizedBox(height: 20,),
                   
                   Text("Motivational Quotes",
                   textAlign:TextAlign.center,
                   style: TextStyle(color: Colors.white,
                   fontSize: 27,
                   fontWeight: FontWeight.bold
                   )),

                   ]),), 
                   ),
                  ), 
                  SizedBox(height: 20),
             





           ],), 
          ],
        ),
      ),
   );
  }
}
