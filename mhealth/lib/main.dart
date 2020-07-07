import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mhealth/models/user.dart';
import 'package:mhealth/services/auth.dart';
import 'package:provider/provider.dart';

import 'home/wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Wrapper(),
  ),
    );
  }
}

