import 'package:flutter/material.dart';
import 'package:mhealth/models/user.dart';
import 'package:mhealth/pages/updateForm.dart';
import 'package:mhealth/services/database.dart';
import 'package:mhealth/shared/constants.dart';
import 'package:mhealth/shared/loading_widget.dart';
import 'package:provider/provider.dart';

class UserInfoHolder extends StatefulWidget {
  @override
  _UserInfoHolderState createState() => _UserInfoHolderState();
}

class _UserInfoHolderState extends State<UserInfoHolder> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final user = Provider.of<User>(context);

    void _showUpdateForm() {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
              child: UpdateForm(),
            );
          });
    }

    return StreamBuilder<CurrentUserData>(
        stream: DatabaseService(uid: user.uid).currentUserData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            CurrentUserData currentUserData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller:
                              TextEditingController(text: currentUserData.name),
                          decoration:
                              textInputDecoration.copyWith(labelText: 'Name'),
                          readOnly: true,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: TextEditingController(
                              text: currentUserData.contact),
                          decoration: textInputDecoration.copyWith(
                              labelText: 'Emergency Contact No.'),
                          readOnly: true,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller:
                              TextEditingController(text: currentUserData.bog),
                          decoration: textInputDecoration.copyWith(
                              labelText: 'Blood Group'),
                          readOnly: true,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller:
                              TextEditingController(text: currentUserData.bp),
                          decoration: textInputDecoration.copyWith(
                              labelText: 'Blood Pressure', hintText: 'mm-Hg'),
                          readOnly: true,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: TextEditingController(
                              text: currentUserData.weight),
                          decoration: textInputDecoration.copyWith(
                              labelText: 'Weight', hintText: 'Kg'),
                          readOnly: true,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: TextEditingController(
                              text: currentUserData.sugar),
                          decoration: textInputDecoration.copyWith(
                              labelText: 'Sugar Level', hintText: 'mg/dL'),
                          readOnly: true,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        MaterialButton(
                          color: Color(0xff9ce47c),
                          height: 50,
                          elevation: 0,
                          minWidth: double.infinity,
                          onPressed: () => _showUpdateForm(),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            'Edit',
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
            );
          } else {
            return Loading();
          }
        });
  }
}
