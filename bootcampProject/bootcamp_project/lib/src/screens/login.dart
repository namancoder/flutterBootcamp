import 'package:bootcamp_project/src/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;

  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'EMAIL',
              ),
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'PASSWORD',
              ),
              onChanged: (value) {
                setState(() {
                  _password = value.trim();
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                  color: Theme.of(context).accentColor,
                  child: Text("Sign IN"),
                  onPressed: () {
                    auth.signInWithEmailAndPassword(
                        email: _email, password: _password);
                    Navigator.of(context).pushReplacement((MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    )));
                  }),
              RaisedButton(
                  color: Theme.of(context).accentColor,
                  child: Text("Sign UP"),
                  onPressed: () {
                    auth.createUserWithEmailAndPassword(
                        email: _email, password: _password);
                    Navigator.of(context).pushReplacement((MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    )));
                  }),
            ],
          )
        ],
      ),
    );
  }
}
