// import 'package:firebase_auth/firebase_auth.dart';

// class UserResponsitory {
//   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   Future<void> signUp(String email, String password) async {
//     try {
//       await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
//     } on FirebaseAuthException catch (e) {
//       print(e);
//     }
//   }

//   Future logIn(String email, String password) async {
//     try {
//       var auth = await firebaseAuth.signInWithEmailAndPassword(
//           email: email, password: password);
//       return auth.user;
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   Future<void> signOut() async {
//     await firebaseAuth.signOut();
//   }

//   Future<bool> isSignIn() async {
//     var currentUser = await firebaseAuth.currentUser;
//     return currentUser != null;
//   }

//   Future<User?> getCurrentUser() async {
//     return await firebaseAuth.currentUser;
//   }
// }
