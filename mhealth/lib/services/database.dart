import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

final String uid;
DatabaseService({ this.uid });

  final CollectionReference userData = Firestore.instance.collection('users');

  Future updateUserData(String name, String contact, String bog, String bp, String weight, String sugar) async {
    return await userData.document(uid).setData({
      'name' : name,
      'contact' : contact,
      'bog' : bog,
      'bp' : bp,
      'weight' : weight,
      'sugar' : sugar,
    });
  }
}