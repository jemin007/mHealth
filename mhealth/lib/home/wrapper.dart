import 'package:flutter/material.dart';
import 'package:mhealth/authenticate/authenticate.dart';
import 'package:mhealth/dashboard/dashboard.dart';
import 'package:mhealth/home/login.dart';
import 'package:mhealth/home/splash.dart';
import 'package:mhealth/models/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);
    
    if(user == null) {
      return Authenticate();
    } else {
      return Dashboard();
    }
  }
}