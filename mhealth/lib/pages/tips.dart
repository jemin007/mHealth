import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mhealth/pages/elements/textStyles.dart';
import 'package:mhealth/shared/loading_widget.dart';

class Tips extends StatefulWidget {
  @override
  _TipsState createState() => _TipsState();
}

class _TipsState extends State<Tips> {
  List<Widget> tipListWidget(AsyncSnapshot snapshot) {
    return snapshot.data.documents.map<Widget>((document) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Column(
            children: <Widget>[
              StreamBuilder(
                  stream: Firestore.instance.collection('tips').snapshots(),
                  builder: (context, snapshot) {
                    return Column(children: [
                      CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white,
                            child: ClipOval(
                              child: Image.network(document['image'],
                                  width: 150, fit: BoxFit.fill),
                            ),
                          ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          // SizedBox(
                          //   width: 23,
                          // ),
                          Flexible(
                            child: RichText(
                                text: TextSpan(
                              text: "${document['title']}",
                              style: infoHead,
                              children: [
                                TextSpan(
                                    text: "\n\n${document['tip']}",
                                    style: infoSubHead),
                              ],
                            )),
                          ),
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
        Text('Tips', style: pageHeader),
        SizedBox(
          height: 20,
        ),
        StreamBuilder(
            stream: Firestore.instance.collection('tips').snapshots(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Loading();
                default:
                  return Column(
                    children: tipListWidget(snapshot),
                  );
              }
            }),
      ],
    );
  }
}
