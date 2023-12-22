import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:list_it/Components/add_data.dart';
import 'package:list_it/Components/utils.dart';
import 'package:list_it/services/user_service.dart';

class ProfileSettingPage extends ConsumerStatefulWidget {
  const ProfileSettingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProfileSettingPageState();
}

class _ProfileSettingPageState extends ConsumerState<ProfileSettingPage> {
  File? _image;
  bool isLoading = false;

  void selectImage() async {
    File img = await pickImage();
    setState(() {
      _image = img;
    });
  }

  void saveProfilePhoto() async {
    setState(() {
      isLoading = true;
    });
    await StoreData().saveData(file: _image!).then((value) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Container(
        child: Text(value),
      )));
      ref.invalidate(userDetailsProvider);
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pop();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Account Settings'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: isLoading
                ? const CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          _image != null
                              ? CircleAvatar(
                                  radius: 64,
                                  backgroundImage: FileImage(_image!),
                                )
                              : CircleAvatar(
                                  radius: 64,
                                  backgroundImage: NetworkImage(ref
                                              .watch(userDetailsProvider)
                                              .value!
                                              .profileImage ==
                                          ''
                                      ? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'
                                      : ref
                                          .watch(userDetailsProvider)
                                          .value!
                                          .profileImage),
                                ),
                          Positioned(
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
                      ElevatedButton(
                          onPressed: saveProfilePhoto,
                          child: const Text('Save changes'))
                    ],
                  ),
          ),
        ));
  }
}
