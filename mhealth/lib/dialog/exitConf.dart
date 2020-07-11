import 'package:flutter/material.dart';
import 'package:mhealth/services/auth.dart';

class ExitConfirmationDialog extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {    
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }
}

_buildChild(BuildContext context) => Container(
      height: 300,
      decoration: BoxDecoration(
          color: Color(0xff8dbbf2),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Image.asset(
                'assets/sad.png',
                height: 120,
                width: 120,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text('Do you want to log out? ', style: TextStyle(fontSize: 22.0, color: Colors.white, fontWeight: FontWeight.bold),),
          SizedBox(
            height: 20,
          ),
          Row(           
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FlatButton(onPressed: () {
                Navigator.of(context).pop();
              }, child: Text('No', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
              SizedBox(width: 8.0,),
              RaisedButton(onPressed: () async {
                final AuthService _auth = AuthService();
                await _auth.signOut();
                Navigator.of(context).pop();
              }, child: Text('Yes', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
            ],
          ),
        ],
      ),
    );
