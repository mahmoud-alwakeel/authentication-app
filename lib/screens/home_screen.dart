import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GoogleSignIn googleSignIn = GoogleSignIn();
    return Scaffold(
      appBar: AppBar(
        title: const Text('home screen'),
        actions: [
          IconButton(onPressed: () async {
            googleSignIn.disconnect();
            await FirebaseAuth.instance.signOut();
            Navigator.of(context).pushReplacementNamed('/login');
          }, icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: Container(),
    );
  }
}