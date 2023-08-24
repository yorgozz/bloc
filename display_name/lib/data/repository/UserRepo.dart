import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:display_name/data/models/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepo {
  Future<UserModel?> fetchCurrentUserDetails() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        print("here2");
        CollectionReference usersCollection =
            FirebaseFirestore.instance.collection('users');

        DocumentSnapshot userSnapshot =
            await usersCollection.doc(user.uid).get();

        if (userSnapshot.exists) {
          UserModel userModel =
              UserModel.fromJson(userSnapshot.data() as Map<String, dynamic>);

          print("here3 ${userModel.firstName}");
          return userModel;
        }
      }
      print("here4");
      return UserModel.empty;
    } catch (e) {
      print('Error checking user and retrieving data: $e');
      return UserModel.empty;
    }
  }
}
