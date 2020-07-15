import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class CallCard extends StatefulWidget {
  @override
  _CallCardState createState() => _CallCardState();
}

class _CallCardState extends State<CallCard> {
  @override
  Widget build(BuildContext context) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Text(
                'Are you feeling well today?',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Give us a call or visit our website.',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 23.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FlatButton(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    color: Color(0xff9ce47c),
                    onPressed: () {
                      final String phone = "4441577";
                      launch('tel:$phone');
                      print('here');
                    },
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          LineAwesomeIcons.phone,
                          size: 22,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Call Now',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 1.0,
                  ),
                  FlatButton(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    color: Color(0xff54b0f3),
                    onPressed: () {
                      final String url = "https://softwarica.edu.np/";
                      launch(url);
                      print('here');
                    },
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          LineAwesomeIcons.globe,
                          size: 22,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Website',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          height: 200,
          width: 430,
          padding: EdgeInsets.fromLTRB(30, 10, 30, 20),
          decoration: BoxDecoration(
              color: Color(0xffd8dde9),
              borderRadius: BorderRadius.all(Radius.circular(29)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  spreadRadius: 0.5,
                  blurRadius: 0.5,
                )
              ]),
        );
  }
}
