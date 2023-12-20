import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description ({super.key, required this.txtController});

  final TextEditingController txtController;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: TextField(
        controller: txtController,
        maxLines: 5,
        decoration: InputDecoration(
          enabledBorder:  OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText:'Task description',
          hintStyle: TextStyle(color: Colors.grey[500]),
          )));
  }
}