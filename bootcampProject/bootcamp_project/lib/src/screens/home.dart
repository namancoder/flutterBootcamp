import 'package:bootcamp_project/src/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FlatButton(
        child: Text(
          ("Logout"),
        ),
        onPressed: () {
          auth.signOut();
          Navigator.of(context).pushReplacement(
              (MaterialPageRoute(builder: (context) => LoginScreen())));
        },
      )),
    );
  }
}
