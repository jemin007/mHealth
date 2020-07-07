import 'package:flutter/material.dart';
import 'package:mhealth/home/login.dart';
import 'package:mhealth/home/signup.dart';

class Authenticate extends StatefulWidget {
  Authenticate({Key key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;

  //  exclamation will revert the state i.e. true -> false
    void toggleView() {
      setState(() => showSignIn = !showSignIn);
    }

  @override
  Widget build(BuildContext context) {
    
    if (showSignIn) {
      return LoginPage(toggleView: toggleView);
    } else {
      return SignUp(toggleView: toggleView);
    }
  }
}