import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:list_it/Components/add_data.dart';
import 'package:list_it/Components/utils.dart';

class ProfileSettingPage extends StatefulWidget {
  const ProfileSettingPage ({super.key});
  
  
  @override
  State<StatefulWidget> createState() => _ProfileSettingPageState();

  

}
class _ProfileSettingPageState extends State<ProfileSettingPage> {

    Uint8List? _image;

    void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void savePeofile () async{
    String resp = await StoreData().saveData(file: _image!);
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: const Text('Account Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
    Stack(
      children: [
        _image != null ?
        CircleAvatar(
          radius: 64,
          backgroundImage: MemoryImage(_image!),
        ):
        const CircleAvatar(
          radius: 64,
            backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
          ),
          Positioned (
            bottom: -10,
            left: 80,
              child: IconButton(
              onPressed: selectImage, 
              icon: const Icon(Icons.add_a_photo),
          ),
          )
        ],
      ),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: savePeofile,
            child: const Text('Save changes'))
          ],
        ),
      )
    );
  }
}