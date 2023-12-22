import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;

class StoreData {
  Future<String> uploadImageToStorage(String childName, File file) async {
    Reference ref = _storage.ref().child(childName).child('id');
    UploadTask uploadTask = ref.putFile(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadURL = await snapshot.ref.getDownloadURL();
    return downloadURL;
  }

  Future<String> saveData({required File file}) async {
    String resp = "Some error occurred";
    try {
      String imgUrl = await uploadImageToStorage('Profile Image', file);
      await _firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .update({'profileImage': imgUrl});
      resp = "Success";
    } catch (err) {
      resp = err.toString();
    }
    return resp;
  }
}
