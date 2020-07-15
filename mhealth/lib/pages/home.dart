import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:mhealth/helper/dialog_helper.dart';
import 'package:mhealth/pages/elements/call.dart';
import 'package:mhealth/pages/elements/image_carousel.dart';
import 'package:mhealth/pages/elements/info_card.dart';


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
                //content inside header
                Positioned(
                  top: 80,
                  left: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      SizedBox(width: 10.0,),
                      // Padding(padding: EdgeInsets.only(right: 200.0)),
                      IconButton(
                          icon: Icon(
                            LineAwesomeIcons.power_off,
                            size: 40.0,
                          ),
                          onPressed: () {
                            DialogHelper.exit(context);
                            // await _auth.signOut();
                          }),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0,),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(padding: EdgeInsets.fromLTRB(8, 1, 8, 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  
                  Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      ImageCarousel(),
                      SizedBox(height: 14,),
                      CallCard(),
                      SizedBox(height: 14,),
                      Infographics(),
                    ],
                  ),
                ),
                
                ],
              ),
              ),  
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
            colors: [Color(0xfffdeecc), Color(0xff8dbbf2)]),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        )),
  );
}