import 'package:firebase_auth/firebase_auth.dart';
import 'package:mhealth/models/user.dart';
import 'package:mhealth/services/database.dart';

class AuthService {

    final FirebaseAuth _auth = FirebaseAuth.instance;

    //create user obj from firebase user
    User _userFromFirebase(FirebaseUser user) {
      return user != null ? User(uid : user.uid) : null;
    }

    //get uid 
    // Future<String>getCurrentUID() async {
    //   return (await _auth.currentUser()).uid;
    // }

    //auth change stream
    Stream<User> get user {
      return _auth.onAuthStateChanged.map(_userFromFirebase);
    }

    //login
    Future signInWithEmailAndPass(String email, String password, ) async{
      try {
        AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password,);
      FirebaseUser user = result.user;

      //create a new document for the user with the uid
      //name, contact, bog, bp, weight, sugar
      //await DatabaseService(uid: user.uid).updateUserData('ram', '12121212', 'A', 'a', '12', '1');
      return _userFromFirebase(user);
      } catch(e) {
        print(e.toString());
        return null;
      }
    }

    //String name, String contact, String bog, String bp, String weight, String sugar
    //register with email and pass
    Future registerWithEmailAndPass(String email, String password,) async{
      try {
        AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password,);
      FirebaseUser user = result.user;

      //create a new document for the user with the uid
      //'ram', '12121212', 'A', 'a', '12', '1'
      //name, contact, bog, bp, weight, sugar
      await DatabaseService(uid: user.uid).updateUserData('Your Name', '986X-XXXXX', 'A+', '120-20', '65', '120');
      return _userFromFirebase(user);
      } catch(e) {
        print(e.toString());
        return null;
      }
    }

    //signout
    Future signOut() async {
      try {
        await _auth.signOut();
      } catch(e) {
        print(e.toString());
      }
    }

}