import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:list_it/pages/home_page.dart';
import 'package:list_it/pages/login_or_register_page.dart';
// import 'package:list_it/pages/login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is logged in
          if (snapshot.hasData) {
            return const HomePage();
          }
          //user is NOT logged in
          else {
            return LoginOrRegisterPage();
          }
        }

      ),
    );
  }
}