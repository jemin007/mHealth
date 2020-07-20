import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mhealth/pages/elements/textStyles.dart';
import 'package:mhealth/shared/loading_widget.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 28, vertical: 37),
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
                                  text: "\n\nContact: ${document['contact']}",
                                  style: infoHead),
                              TextSpan(
                                  text:
                                      "\n\nLocation: ${document['location']}",
                                  style: infoHead),
                              TextSpan(
                                  text: "\n\nBeds: ${document['beds']}",
                                  style: infoHead),
                            ],
                          )),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ]);
                  }),
              SizedBox(
                height: 15,
              ),
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
              switch(snapshot.connectionState){
                case ConnectionState.waiting:
                  return Loading();
                default:  return Column(
                children: hospitalListWidget(snapshot),
              );

              }
              
            }),
      ],
    );
  }
}
