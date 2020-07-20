import 'package:flutter/material.dart';
import 'package:mhealth/services/auth.dart';
import 'package:mhealth/shared/constants.dart';
import 'package:mhealth/shared/loading_widget.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp ({ this.toggleView });
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  String name, email, password, contact, bp, error, weight, sugar= '';
  String bog;
  bool loading = false;
  final AuthService _auth = AuthService();
  final List<String> bloodgrp = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        
      ),
      body: SingleChildScrollView(
        
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height,
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
                  
              MaterialButton(
                color: Color(0xfffdeecc),
                height: 60,
                elevation: 0,
                minWidth: double.infinity,
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    //name, bog, weight, bp, sugar, contact
                    setState(() => loading = true);
                    dynamic result = await _auth.registerWithEmailAndPass(email, password);
                      if (result == null) {
                        setState(() {error = 'please enter valid information';
                        loading = false;
                        });
                      }


                  }
                },
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
              SizedBox(height: 10.0,),
              MaterialButton(
                color: Color(0xff8dbbf2),
                height: 60,
                elevation: 0,
                minWidth: double.infinity,
                onPressed: () async { widget.toggleView();},
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ),
              ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
