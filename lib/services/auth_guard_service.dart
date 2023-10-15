import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthGuardService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
// instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ///sign in
  Future<UserCredential> signIn(String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      _firestore.collection('users').doc(userCredential.user!.uid).set(
          {"uid": userCredential.user!.uid, 'email': email},
          SetOptions(merge: true));

      return userCredential;
    } on FirebaseException catch (e) {
      throw Exception(e.code);
    }
  }

  ///register
  Future<UserCredential> register(String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({"uid": userCredential.user!.uid, 'email': email});

      return userCredential;
    } on FirebaseException catch (e) {
      throw Exception(e.code);
    }
  }

  ///sign out
  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }
}
