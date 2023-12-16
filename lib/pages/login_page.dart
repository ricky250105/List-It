// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:list_it/Components/my_button.dart';
import 'package:list_it/Components/my_textfield.dart';
import 'package:list_it/pages/forgot_pw_page.dart';
import 'package:list_it/pages/terms_and_condition.dart';

class LoginPage extends StatefulWidget {
  Function()? onTap;
  LoginPage ({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
// text editing controller
final _emailController = TextEditingController();
final _passwordController = TextEditingController();

//Sign User In
void signUserIn() async {

  //show loading circle
  showDialog(context: context, 
  builder: (context) {
    return Center(
      child: CircularProgressIndicator());
  });

  //try sign in
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text
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

//error message to user
void showErrorMessage(String message) {
  showDialog(
    context: context, 
    builder: (context) {
      return  AlertDialog(
        backgroundColor: Color.fromRGBO(134, 167, 137, 1),
        title: Center(
          child: Text(
            message
          )
        )
      );
    }
  );
}

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 243, 232, 1),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            //Welcome back, let's sign you in
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Text(
                    "Welcome back, \nLet's Sign you in",
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
            
            const SizedBox(height:20),
            
            //email textffield
            MyTextField(
              controller: _emailController,
              hintText: 'E-mail',
              obscureText: false,
            ),
            const SizedBox(height: 25),
            
            //password textfield
            MyTextField(
              controller: _passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 10),
            
            //forgot password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap:() {
                      Navigator.push(context, 
                        MaterialPageRoute(builder: (context) {
                          return ForgotPasswordPage();
                        }));
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                        )
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 50),
            
            //Login button
            MyButton(
              text: 'Sign In',
              onTap: signUserIn,

            ),
            const SizedBox(height: 100),
            
            //Dont have an account? sign up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? "),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text("Register now",
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold) 
                  ),
                ),
                SizedBox(height: 20)
              ],
            ),
            //Terms and Policy LOL
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('By continuing, you agree to our '),
                GestureDetector(
                  onTap:() {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return const TermsAndConditionPage();
                  }));
                  },
                  child: Text('terms and conditions', style: TextStyle(decoration: TextDecoration.underline))),
                SizedBox(height: 50)
              ]
            )
                  ]),
          ))
    ));
  }
}

