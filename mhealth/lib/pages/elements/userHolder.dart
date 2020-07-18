import 'package:flutter/material.dart';
import 'package:mhealth/shared/constants.dart';
import 'package:provider/provider.dart';
import 'package:mhealth/models/userlist.dart';

class UserInfoHolder extends StatefulWidget {
  @override
  _UserInfoHolderState createState() => _UserInfoHolderState();
}

class _UserInfoHolderState extends State<UserInfoHolder> {
  @override
  Widget build(BuildContext context) {


    void _showUpdateForm() {
      showModalBottomSheet(
        context: context, 
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
            child: Text('bottom'),
          );
        });
    }

    final user = Provider.of<List<UserData>>(context);
    user.forEach((element) {
      print(element.name);
      print(element.contact);
    });
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: TextEditingController(text: "Hello"),
                decoration: textInputDecoration.copyWith(labelText: 'Name'),
                readOnly: true,
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: TextEditingController(text: "Hello"),
                decoration: textInputDecoration.copyWith(
                    labelText: 'Emergency Contact No.'),
                readOnly: true,
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: TextEditingController(text: "Hello"),
                decoration:
                    textInputDecoration.copyWith(labelText: 'Blood Group'),
                readOnly: true,
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: TextEditingController(text: "Hello"),
                decoration: textInputDecoration.copyWith(
                    labelText: 'Blood Pressure', hintText: 'mm-Hg'),
                readOnly: true,
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: TextEditingController(text: "Hello"),
                decoration: textInputDecoration.copyWith(
                    labelText: 'Weight', hintText: 'Kg'),
                readOnly: true,
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: TextEditingController(text: "Hello"),
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
    );
  }
}
