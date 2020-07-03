import 'package:flutter/material.dart';
import 'package:mhealth/shared/constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String email, password, error = '';

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                //expanded fills extra space in rows or colms
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text('Login', style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        )),
                        SizedBox(height: 50,),
                        
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Form(
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
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                validator: (val) => val.length < 8 ? 'Enter password(8+ charcater)' : null,
                                onChanged: (val) {
                                  setState(() => password = val);
                                },
                            ),
                            // makeInput(label: 'Email'),
                            // makeInput(label: 'Password', obscureText: true),
                        ],),
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 40),
                    child:  MaterialButton(
                      color: Color(0xff8dbbf2),
                      height: 60,
                      elevation: 0,
                      minWidth: double.infinity,
                      onPressed: (){
                        
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
                    ),
                    Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Dont't have an account?  ", style: TextStyle(
                      fontSize: 16,
                    ),), 
                    Text('Sign Up', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),),
                  ],
                ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/lg.png'),
                    fit: BoxFit.cover),
                    
                ),
              )
            ],
          ),
        ),
    );
  }
}

Widget makeInput({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(label, style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      )),
      SizedBox(height: 5,),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[400],
            )
            ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[800],
            )
            ),
        ),
      ),
      SizedBox(height: 30,),
    ],
  );
}