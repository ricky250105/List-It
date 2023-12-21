import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore =FirebaseFirestore.instance;

class StoreData{
    Future<String> uploadImageToStorage(String childName, Uint8List file) async{
      Reference ref = _storage.ref().child(childName).child('id');
      UploadTask uploadTask = ref.putData(file);
      TaskSnapshot snapshot = await uploadTask;
      String downloadURL = await snapshot.ref.getDownloadURL();
      return downloadURL;
    }

    Future<String> saveData ({required Uint8List file}) async{
      String resp = "Some error occured";
      try {
        String imgUrl = await uploadImageToStorage('Profile Image', file);
        await _firestore.collection('users').add({'image link' : imgUrl});
        resp = "Success";
      }
      catch(err) {
        resp = err.toString();
      }
      return resp;
    }
}
