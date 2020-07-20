import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:mhealth/pages/elements/textStyles.dart';
import 'package:mhealth/shared/loading_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class Hospital extends StatefulWidget {
  @override
  _HospitalState createState() => _HospitalState();
}

class _HospitalState extends State<Hospital> {
  List<Widget> hospitalListWidget(AsyncSnapshot snapshot) {
    return snapshot.data.documents.map<Widget>((document) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 26),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Column(
            children: <Widget>[
              StreamBuilder(
                  stream: Firestore.instance.collection('hospital').snapshots(),
                  builder: (context, snapshot) {
                    return Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                            child: ClipOval(
                              child: Image.network(document['image'],
                                  height: 100, fit: BoxFit.fill),
                            ),
                          ),
                          SizedBox(
                            width: 23,
                          ),
                          RichText(
                              text: TextSpan(
                            text: "Name: ${document['name']}",
                            style: infoHead,
                            children: [
                              TextSpan(
                                    text:
                                        "\n\nContact: ",
                                    style: infoHead),
                              TextSpan(
                                  text: "${document['contact']}",
                                  style: infoSubHead),
                                  TextSpan(
                                    text:
                                        "\n\nLocation: ",
                                    style: infoHead),
                              TextSpan(
                                  text: " ${document['location']}",
                                  style: infoSubHead),
                                  TextSpan(
                                    text:
                                        "\n\nBeds: ",
                                    style: infoHead),
                              TextSpan(
                                  text: " ${document['beds']}",
                                  style: infoSubHead),
                            ],
                          )),
                          
                          
                        ],
                      ),
                      SizedBox(
                            height: 30,
                          ), 
                      Container(
                        width: 135,
                        child: Column(
                          
                          children: <Widget>[
                            FlatButton(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  color: Color(0xff9ce47c),
                                  onPressed: () {
                                    final String phone = "${document['contact']}";
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
                          ],
                        ),
                      )
                    ]);
                  }),

            ],
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 40,
        ),
        Text('Hospitals', style: pageHeader),
        SizedBox(
          height: 20,
        ),
        StreamBuilder(
            stream: Firestore.instance.collection('hospital').snapshots(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Loading();
                default:
                  return Column(
                    children: hospitalListWidget(snapshot),
                  );
              }
            }),
      ],
    );
  }
}
