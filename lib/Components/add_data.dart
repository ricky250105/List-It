import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class storeData {
  Future <String> uploadImageToStorage (String childName,Uint8List file) async {
    Reference ref = _storage.ref().child(childName);
    UploadTask uploadTask = ref.putData(file);
      TaskSnapshot snapshot = await uploadTask;
    String downloadURL = await snapshot.ref.getDownloadURL();
    return downloadURL;
  }

Future<String> saveData ({
  required String username, 
  required Uint8List file
  }) async{
    String resp = "Some Error Occured";
    try{
      if(username.isNotEmpty) {
      String imageUrl = await uploadImageToStorage('profileImage', file);
      await _firestore.collection('userProfile').add({
        'username' : username,
        'imageLink' : imageUrl,
      });
      resp = 'success';
      }
    }
  
      catch (err){
        resp = err.toString();
      }
      return resp;
}
}