// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';

// class CurrentUser extends ChangeNotifier {
//   String _uid;
//   String _email;

//   String get getUid => _uid;

//   String get getEmail => _email;

//   FirebaseAuth _auth = FirebaseAuth.instance;

//   Stream<User> get authState => _auth.idTokenChanges();

//   //Sign Up
//   Future<bool> signUpUser(String email, String password) async {
//     bool retVal = false;
//     try {
//       UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       if (_authResult.user != null) {
//         retVal = true;
//       }
//     } catch (e) {
//       print(e);
//     }
//     return retVal;
//   }

//   //Sign In
//   Future<bool> logInUser(String email, String password) async {
//     bool retVal = false;
//     try {
//       UserCredential _authResult = await _auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       if (_authResult.user != null) {
//         _uid = _authResult.user.uid;
//         _email = _authResult.user.email;
//         retVal = true;
//       }
//     } catch (e) {
//       print(e);
//     }
//     return retVal;
//   }

//   //Sign Out
//   Future<bool> signOutUser() async {
//     bool retVal = false;
//     try {
//       await _auth.signOut();
//     } catch (e) {
//       print(e);
//     }
//     return retVal;
//   }
// }
