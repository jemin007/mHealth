import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mhealth/pages/elements/textStyles.dart';
import 'package:mhealth/shared/loading_widget.dart';

class Disease extends StatefulWidget {
  @override
  _DiseaseState createState() => _DiseaseState();
}

class _DiseaseState extends State<Disease> {
  List<Widget> diseaseListWidget(AsyncSnapshot snapshot) {
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
                  stream: Firestore.instance.collection('disease').snapshots(),
                  builder: (context, snapshot) {
                    return Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 23,
                          ),
                          Flexible(
                            child: RichText(
                                text: TextSpan(
                              text: "Disease: ${document['name']}",
                              style: infoHead,
                              children: [
                                TextSpan(
                                    text: "\n\nSymptoms: ", style: infoHead),
                                TextSpan(
                                    text: " ${document['symptoms']}",
                                    style: infoSubHead),
                                TextSpan(
                                    text: "\n\nTreatment: ", style: infoHead),
                                TextSpan(
                                    text: "${document['treatment']}",
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
        Text('Common Diseases', style: pageHeader),
        SizedBox(
          height: 20,
        ),
        StreamBuilder(
            stream: Firestore.instance.collection('disease').snapshots(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Loading();
                default:
                  return Column(
                    children: diseaseListWidget(snapshot),
                  );
              }
            }),
      ],
    );
  }
}
