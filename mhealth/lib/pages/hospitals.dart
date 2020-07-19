import 'package:flutter/material.dart';
import 'package:mhealth/pages/elements/textStyles.dart';

class Hospital extends StatefulWidget {
  @override
  _HospitalState createState() => _HospitalState();
}

class _HospitalState extends State<Hospital> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 28, vertical: 37),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: AssetImage('assets/wash.png'),
                       radius: 46,
                    ),
                    SizedBox(width: 23,),
                    RichText(
                      text: TextSpan(
                        text: 'Name:', style: infoHead,                  
                        children:[
                          TextSpan(
                            text: '\n\nContact:',
                            style: infoHead
                          ),
                          TextSpan(
                            text: '\n\nLocation:',
                            style: infoHead
                          ),
                          TextSpan(
                            text: '\n\nBeds:',
                            style: infoHead
                          ),
                        ], ))
                  ],
                ),
                SizedBox(height: 15,),
                
              ],
            ),
          ),
        )
      ],
    );
  }
}