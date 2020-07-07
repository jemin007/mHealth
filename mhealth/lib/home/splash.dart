import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mhealth/home/login.dart';
import 'package:mhealth/home/signup.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 55),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Welcome', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                ),
                
                ],
              ),
               Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/cc.png'),
                    )
                ),
              ),
              Column(
                children: <Widget>[
                  MaterialButton(
                    color: Color(0xff8dbbf2),
                    height: 60,
                    elevation: 0,
                    minWidth: double.infinity,
                    onPressed: (){ 
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text('Login', style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      child: MaterialButton(
                    color: Color(0xfffdeecc),
                    height: 60,
                    minWidth: double.infinity,
                    onPressed: (){ 
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text('Sign Up', style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),),
                    ),
                    )
                ],
              )
            ],
          ),
        ),
        
      ),
    );
  }
}
