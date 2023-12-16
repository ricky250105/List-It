import 'package:flutter/material.dart';
import 'package:list_it/Components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage ({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();

}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
        .sendPasswordResetEmail(email: _emailController.text.trim());
        showDialog(context: context, builder: (context){
          return const AlertDialog(
            content: Text(('Password reset link sent!')),
          );
        });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(134, 167, 137, 1),
        elevation: 0,
      ),

      backgroundColor: const Color.fromRGBO(235, 243, 232, 1),
      body: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //text hint to insert email
          const Text('Enter your e-mail to receive a password reset link', textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
          const SizedBox(height: 20),

          //textfield to insert email
          MyTextField(controller: _emailController, hintText: "E-mail", obscureText: false),
          const SizedBox(height: 20),

          //button
          MaterialButton(
            onPressed: passwordReset,
            color: const Color.fromRGBO(178, 200, 186, 1),
            child: const Text('Reset Password'),
          ),
        ],
      ),
    );
  }
}