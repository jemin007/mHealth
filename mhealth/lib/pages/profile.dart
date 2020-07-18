import 'package:flutter/material.dart';
import 'package:mhealth/models/userlist.dart';
import 'package:mhealth/pages/elements/textStyles.dart';
import 'package:mhealth/pages/elements/userHolder.dart';
import 'package:mhealth/services/database.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name, email, password, contact, bp, error, weight, sugar = '';
  String bog;
  bool loading = false;
  final List<String> bloodgrp = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-'
  ];
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<UserData>>.value(
      value: DatabaseService().user,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text('My Profile', style: pageHeader),
            SizedBox(
              height: 40,
            ),
            UserInfoHolder(),
          ],
        ),
      ),
    );
  }
}
