import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:mhealth/pages/disease.dart';
import 'package:mhealth/pages/home.dart';
import 'package:mhealth/pages/hospitals.dart';
import 'package:mhealth/pages/profile.dart';
import 'package:mhealth/pages/tips.dart';

class Dashboard extends StatefulWidget {

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int _currentIndex = 0;

    //importing pages
    final Hospital _hospital = Hospital();
    final Tips _tips = Tips();
    final Home _home = Home();
    final Disease _disease = Disease();
    final Profile _profile = Profile();

    Widget _showCurrent = Hospital();

    // ignore: missing_return
    Widget _routePage(int hal) {
      switch (hal) {
        case 0:
        return _hospital;
        break;
        case 1:
        return _tips;
        break;
        case 2:
        return _home;
        break;
        case 3:
        return _disease;
        break;
        case 4:
        return _profile;
      }
    }

  @override
  Widget build(BuildContext context) {

      return Scaffold(
        backgroundColor: Colors.grey[200],
        body: ListView(children: <Widget>[_showCurrent],),
      bottomNavigationBar: CurvedNavigationBar(    
        backgroundColor: Color(0xff8dbbf2),
        buttonBackgroundColor: Colors.white,
        height: 70,
        items: <Widget>[
          Icon(LineAwesomeIcons.ambulance, size: 30, color: Colors.blue),
          Icon(LineAwesomeIcons.info, size: 30, color: Colors.blue),
          Icon(LineAwesomeIcons.home, size: 30, color: Colors.blue),
          Icon(LineAwesomeIcons.optin_monster, size: 30, color: Colors.blue),
          Icon(LineAwesomeIcons.user, size: 30, color: Colors.blue),
        ],
        animationDuration: Duration(milliseconds: 300),
        animationCurve: Curves.easeInOutExpo,
        index: _currentIndex,
        onTap: (int press) {
          setState(() {
          _showCurrent = _routePage(press);
          });
        },
        ),
    );
  }
}
