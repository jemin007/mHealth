import 'package:flutter/material.dart';
import 'package:mhealth/pages/elements/textStyles.dart';

class Infographics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 27),
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
                     radius: 40,
                  ),
                  SizedBox(width: 5,),
                  RichText(
                    text: TextSpan(
                      text: 'Wash your hands frequently!', style: infoHead,                  
                      children:[
                        TextSpan(
                          text: '\n\nBe sure to wash your hands frequently.',
                          style: infoSubHead
                        )
                      ], ))
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 27),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: 'Visit doctors every month!', style: infoHead,                  
                      children:[
                        TextSpan(
                          text: '\n\nEarly diagnose and early treatment.',
                          style: infoSubHead
                        )
                      ], )),
                      SizedBox(width: 5,),
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage('assets/doc.png'),
                     radius: 40,
                  ),
                  
                  
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}