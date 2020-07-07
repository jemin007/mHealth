import 'package:flutter/material.dart';
import 'package:mhealth/services/auth.dart';

class Dashboard extends StatelessWidget {

    final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          FlatButton.icon(onPressed: () async{
                await _auth.signOut();
                },
             icon: Icon(Icons.exit_to_app), label: Text(''),),
             
        ],
      ),
      body: Center(
        
        child: Text('Home', style: TextStyle(color: Colors.black, fontSize: 20.0),),
        
      ),
    );
  }
}