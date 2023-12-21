// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:list_it/Components/my_button.dart';
import 'package:list_it/Components/my_textfield.dart';
import 'package:list_it/pages/terms_and_condition.dart';

class RegisterPage extends StatefulWidget {
  Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
// text editing controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _usernameController = TextEditingController();

//Sign User In
  Future signUserUp() async {
    //show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });

    //try creating the account
    try {
      // to check if password and confirm password are the same text
      if (_passwordController.text == _confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim());
      } else {
        //error message if passsword and confirm password are not the same
        showErrorMessage("Passwords don't match!");
        return;
      }

      //add user details
      addUserDetails(
        _usernameController.text.trim(),
        _emailController.text.trim(),
        FirebaseAuth.instance.currentUser!.uid, 
      );

      //pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop the loading circle
      Navigator.pop(context);

      //show error message
      showErrorMessage(e.code);
    }
  }

//add user detail
  Future addUserDetails(String username, String email, String userId) async {
    await FirebaseFirestore.instance.collection('users').doc(userId).set({
      'username': username,
      'email': email,
    });
    print('Users');
  }

//error message to user
  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              backgroundColor: Color.fromRGBO(134, 167, 137, 1),
              title: Center(child: Text(message)));
        });
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(235, 243, 232, 1),
        body: SafeArea(
            child: Center(
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
              //greeting message
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    Text(
                      "Hello, let's sign you up!",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              //profile picture place >:(
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                const SizedBox(height: 50),

                //username textfield
                MyTextField(
                    controller: _usernameController,
                    hintText: 'Username',
                    obscureText: false),
                const SizedBox(height: 10),

                //email textffield
                MyTextField(
                  controller: _emailController,
                  hintText: 'E-mail',
                  obscureText: false,
                ),
                const SizedBox(height: 10),

                //password textfield
                MyTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 10),

                //Confirm password textfield
                MyTextField(
                  controller: _confirmPasswordController,
                  hintText: 'Confirm password',
                  obscureText: true,
                ),
                const SizedBox(height: 50),

                //Login button
                MyButton(
                  text: 'Sign Up',
                  onTap: signUserUp,
                ),
                const SizedBox(height: 100),

                //Dont have an account? sign up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Have an account? "),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text("Login now",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 20)
                  ],
                ),

                //Terms and Policy LOL
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('By continuing, you agree to our '),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const TermsAndConditionPage();
                        }));
                      },
                      child: Text('terms and conditions',
                          style:
                              TextStyle(decoration: TextDecoration.underline))),
                  SizedBox(height: 50)
                ])
              ]),
            ])))));
  }
}
