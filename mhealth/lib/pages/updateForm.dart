import 'package:flutter/material.dart';
import 'package:mhealth/models/user.dart';
import 'package:mhealth/services/database.dart';
import 'package:mhealth/shared/constants.dart';
import 'package:mhealth/shared/loading_widget.dart';
import 'package:provider/provider.dart';

class UpdateForm extends StatefulWidget {
  @override
  _UpdateFormState createState() => _UpdateFormState();
}

class _UpdateFormState extends State<UpdateForm> {
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
  final _formKey = GlobalKey<FormState>();

  String _currentName;
  String _currentBog;
  String _currentBp;
  String _currentWeight;
  String _currentSugar;
  String _currentContact;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return SingleChildScrollView(
      child: StreamBuilder<CurrentUserData>(
          stream: DatabaseService(uid: user.uid).currentUserData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              CurrentUserData currentUserData = snapshot.data;
              return Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: currentUserData.name,
                          decoration:
                              textInputDecoration.copyWith(labelText: 'Name'),
                          keyboardType: TextInputType.text,
                          validator: (val) =>
                              val.isEmpty ? 'Enter your name' : null,
                          onChanged: (val) {
                            setState(() => _currentName = val);
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          initialValue: currentUserData.contact,
                          decoration: textInputDecoration.copyWith(
                              labelText: 'Emergency Contact No.'),
                          keyboardType: TextInputType.number,
                          validator: (val) => val.length < 10
                              ? 'Enter your contact no. (10 Digits)'
                              : null,
                          onChanged: (val) {
                            setState(() => _currentContact = val);
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        DropdownButtonFormField(
                            hint: Text('Blood Group'),
                            decoration: textInputDecoration,
                            value: _currentBog ?? currentUserData.bog,
                            items: bloodgrp.map((bg) {
                              return DropdownMenuItem(
                                value: bg,
                                child: Text('$bg'),
                              );
                            }).toList(),
                            onChanged: (val) =>
                                setState(() => _currentBog = val)),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          initialValue: currentUserData.bp,
                          decoration: textInputDecoration.copyWith(
                              labelText: 'Blood Pressure', hintText: 'mm-Hg'),
                          keyboardType: TextInputType.number,
                          validator: (val) => val.isEmpty
                              ? 'Enter your blood pressure (mm-Hg)'
                              : null,
                          onChanged: (val) {
                            setState(() => _currentBp = val);
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          initialValue: currentUserData.weight,
                          decoration: textInputDecoration.copyWith(
                              labelText: 'Weight', hintText: 'Kg'),
                          keyboardType: TextInputType.number,
                          validator: (val) =>
                              val.isEmpty ? 'Enter your weight (Kg)' : null,
                          onChanged: (val) {
                            setState(() => _currentWeight = val);
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          initialValue: currentUserData.sugar,
                          decoration: textInputDecoration.copyWith(
                              labelText: 'Sugar Level', hintText: 'mg/dL'),
                          keyboardType: TextInputType.number,
                          validator: (val) => val.isEmpty
                              ? 'Enter your sugar level(mg/dL)'
                              : null,
                          onChanged: (val) {
                            setState(() => _currentSugar = val);
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        MaterialButton(
                          color: Color(0xff9ce47c),
                          height: 50,
                          elevation: 0,
                          minWidth: double.infinity,
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              await DatabaseService(uid: user.uid)
                                  .updateUserData(
                                      _currentName ?? currentUserData.name,
                                      _currentContact ??
                                          currentUserData.contact,
                                      _currentBog ?? currentUserData.bog,
                                      _currentBp ?? currentUserData.bp,
                                      _currentWeight ?? currentUserData.weight,
                                      _currentSugar ?? currentUserData.sugar);
                              Navigator.pop(context);
                            }
                          },
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            'Update',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    )
                  ],
                ),
              );
            } else {
              return Loading();
            }
          }),
    );
  }
}
