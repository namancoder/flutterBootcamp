import 'package:bootcamp_project/src/screens/login.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: "Login App",
      theme: ThemeData(accentColor: Colors.orange,
      primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
