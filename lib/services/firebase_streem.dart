import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../login.dart';
import '../profile.dart';
import '../main.dart';

class FirebaseStream extends StatelessWidget {
  const FirebaseStream({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Scaffold(
              body: Center(child: Text('Что-то пошло не так!')));
        } else if (snapshot.hasData) {
          if (!snapshot.data!.emailVerified) {
            return Login();
          }
          return Profile();
        } else {
          return Home();
        }
      },
    );
  }
}