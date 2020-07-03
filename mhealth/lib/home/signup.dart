import 'package:flutter/material.dart';
import 'package:mhealth/shared/constants.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  String name, email, password, contact, bp, error, weight, sugar = '';
  final List<String> bloodgrp = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black87,
          iconSize: 28,
        ),
      ),
      body: SingleChildScrollView(
        
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height -50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text('Sign Up',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Create an account, its free.',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[700])),
                ],
              ),
              Form(
                key: _formKey,
                 child: Column(
                  children: <Widget>[
                    // makeInput(label: 'Email'),
                    // makeInput(label: 'Password', obscureText: true),
                    TextFormField(
                              decoration: textInputDecoration.copyWith(
                                labelText: 'Name'),
                                keyboardType: TextInputType.text,
                                validator: (val) => val.isEmpty ? 'Enter your name' : null,
                                onChanged: (val) {
                                  setState(() => name = val);
                                },
                            ),
                            SizedBox(height: 15,),
                    TextFormField(
                              decoration: textInputDecoration.copyWith(
                                labelText: 'Email'),
                                keyboardType: TextInputType.emailAddress,
                                validator: (val) => val.isEmpty ? 'Enter your email' : null,
                                onChanged: (val) {
                                  setState(() => email = val);
                                },
                            ),
                            SizedBox(height: 15,),
                            TextFormField(
                              decoration: textInputDecoration.copyWith(
                                labelText: 'Password'),
                                obscureText: true,
                                keyboardType: TextInputType.text,
                                validator: (val) => val.length < 8 ? 'Enter your password (8+ character)' : null,
                                onChanged: (val) {
                                  setState(() => password = val);
                                },
                            ),
                            SizedBox(height: 15,),
                            TextFormField(
                              decoration: textInputDecoration.copyWith(
                                labelText: 'Emergency Contact No.'),
                                keyboardType: TextInputType.number,
                                validator: (val) => val.length < 10 ? 'Enter your contact no. (10 Digits)' : null,
                                onChanged: (val) {
                                  setState(() => contact = val);
                                },
                            ),
                            SizedBox(height: 15,),
                            
                            TextFormField(
                              decoration: textInputDecoration.copyWith(
                                labelText: 'Blood Pressure',
                                hintText: 'mm Hg'),
                                keyboardType: TextInputType.text,
                                validator: (val) => val.isEmpty ? 'Enter your blood pressure (mm/Hg)' : null,
                                onChanged: (val) {
                                  setState(() => bp = val);
                                },
                            ),
                            SizedBox(height: 15,),
                            TextFormField(
                              decoration: textInputDecoration.copyWith(
                                labelText: 'Weight',
                                hintText: 'Kg'),
                                keyboardType: TextInputType.number,
                                validator: (val) => val.isEmpty ? 'Enter your weight (Kg)' : null,
                                onChanged: (val) {
                                  setState(() => weight = val);
                                },
                            ),
                            SizedBox(height: 15,),
                            TextFormField(
                              decoration: textInputDecoration.copyWith(
                                labelText: 'Sugar Level',
                                hintText: 'mg/dL'),
                                keyboardType: TextInputType.number,
                                validator: (val) => val.isEmpty ? 'Enter your sugar level(mg/dL)' : null,
                                onChanged: (val) {
                                  setState(() => sugar = val);
                                },
                            ),
                            SizedBox(height: 15,),
                  ],
                ),
              ),
              MaterialButton(
                color: Color(0xfffdeecc),
                height: 60,
                elevation: 0,
                minWidth: double.infinity,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Already have an account?  ",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget makeInput({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          )),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.grey[400],
          )),
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.grey[800],
          )),
        ),
      ),
      SizedBox(
        height: 30,
      ),
    ],
  );
}
