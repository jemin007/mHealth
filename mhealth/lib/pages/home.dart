import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:mhealth/services/auth.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(     
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              overflow: Overflow.visible,
              children: <Widget>[
                _backgroundCover(),
                _greetingCard(),
              ],
              ),

          ],
        ),
        
      ),
    );
    
  }
}


 _backgroundCover() {
   return Container(
     height: 210,
     decoration: BoxDecoration(
       gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xfffdeecc),  Color(0xff8dbbf2)]),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              )
     ),
     );
 }

  _greetingCard() {
    final AuthService _auth = AuthService();
    return Positioned(
      top: 80,
      left:30,
      child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         Text(
            'Hello User',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
           Padding(padding: EdgeInsets.only(right: 200.0)),
           IconButton(
            icon: Icon(LineAwesomeIcons.power_off,
            size: 40.0,
            ), 
            onPressed: () async {
                await _auth.signOut();
             }),
        ],        
      ),      
    );
  }