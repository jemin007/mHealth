import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mhealth/models/userlist.dart';

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

  List<UserData> _userFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return UserData(
        bog: doc.data['bog'] ?? '',
        bp: doc.data['bp'] ?? '',
        contact: doc.data['contact'] ?? '',
        name: doc.data['name'] ?? '',
        sugar: doc.data['sugar'] ?? '',
        weight: doc.data['weight'] ?? '',
        );
    }).toList();
  }

  Stream<List<UserData>> get user {
    return userData.snapshots().map(
      _userFromSnapshot
    );
  }
}