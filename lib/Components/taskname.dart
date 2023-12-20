import 'package:flutter/material.dart';

class Taskname extends StatelessWidget {
  const Taskname ({super.key, required this.txtController});

  final TextEditingController txtController;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: TextField(
        controller: txtController,
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
            hintText:'Task name',
            hintStyle: TextStyle(color: Colors.grey[500]),
            )),
      );
  }
}

