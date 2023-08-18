import 'package:display_name/data/models/userModel.dart';
import 'package:display_name/shared_widgets/GlobError.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AuthRepo {
  CollectionReference usersRef = FirebaseFirestore.instance.collection('users');
  static final AuthRepo _instance = AuthRepo._internal();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  factory AuthRepo() => _instance;
  AuthRepo._internal();

  Future<void> initialize() async {
    await Firebase.initializeApp();
  }

  Future<User?> registerUser(
      String email, String password, String firstName, String lastName) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final UserModel userModel = UserModel(
        email: email.trim(),
        firstName: firstName.trim(),
        lastName: lastName.trim(),
        userId: userCredential.user!.uid,
      );

      await usersRef.doc(userModel.userId).set(userModel.toMap());

      return userCredential.user;
    } catch (e) {
      if (e is FirebaseAuthException) {
        //ErrorSnackbar.showError(context, 'An error occurred: ${e.message}');
      }
    }
    return null;
  }

  Future<User?> loginUser(
      BuildContext context, String email, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } catch (e) {
      print('Error: ${e.toString()}');
      if (e is FirebaseAuthException) {
        ErrorSnackbar.showError(context, 'An error occurred: ${e.message}');
      }
    }
    return null;
  }

  void signout() {
    FirebaseAuth.instance.signOut();
  }
}
