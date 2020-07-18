import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mhealth/models/user.dart';
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

  //userdata from snapshots
  CurrentUserData _currentUserDataFromSnapshot(DocumentSnapshot snapshot) {
    return CurrentUserData(
      uid: uid,
      name: snapshot.data['name'],
      contact: snapshot.data['contact'],
      bog: snapshot.data['bog'],
      bp: snapshot.data['bp'],
      sugar: snapshot.data['sugar'],
      weight: snapshot.data['weight'],
    );
  }

  Stream<List<UserData>> get user {
    return userData.snapshots().map(
      _userFromSnapshot
    );
  }

  //get user doc stream
  Stream<CurrentUserData>get currentUserData {
    return userData.document(uid).snapshots().map(_currentUserDataFromSnapshot);
  }
}