import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:list_it/model/user_model.dart';

final userDetailsProvider = FutureProvider((ref) async {
  return UserServices().getUserData();
});

class UserServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final userCollection = FirebaseFirestore.instance;

 Future<UserModel> getUserData() async { 
 final credentials = await userCollection
      .collection('users')
      .doc(_auth.currentUser!.uid)
      .get();
    return UserModel.fromMap(credentials.data()!);
      }
}
