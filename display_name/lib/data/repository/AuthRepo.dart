import 'package:display_name/data/models/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRepo {
  CollectionReference usersRef = FirebaseFirestore.instance.collection('users');
  static final AuthRepo _instance = AuthRepo._internal();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  factory AuthRepo() => _instance;
  AuthRepo._internal();

  Future<void> initialize() async {
    await Firebase.initializeApp();
  }

  Future<String> registerUser(
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
      return '';
    } catch (e) {
      if (e is FirebaseAuthException) {
        return e.message.toString();
      }
      return 'something went wrong';
    }
  }

  Future<String> loginUser(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return '';
    } catch (e) {
      if (e is FirebaseAuthException) {
        print(e.message.toString());
        return e.message.toString();
      }
      return 'something went wromg';
    }
  }

  void signout() async {
    print("signing out");
    await _auth.signOut();
  }
}
