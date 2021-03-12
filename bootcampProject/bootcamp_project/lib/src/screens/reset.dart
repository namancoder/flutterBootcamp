import 'package:bootcamp_project/src/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  String _email;

  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
            resizeToAvoidBottomInset:false,

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

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                  color: Theme.of(context).accentColor,
                  child: Text("Send request"),
                  onPressed: () {
                    auth.sendPasswordResetEmail(email: _email);
                    Navigator.of(context).pop();
                  }),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: Text("Forgot Password?"),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(
            height: 400,
          ),
          // ChangeNotifierProvider(
          //   create: (context) => GoogleSignInProvider(),
          //   child: StreamBuilder<Object>(
          //       stream: FirebaseAuth.instance.authStateChanges(),
          //       builder: (context, snapshot) {
          //         final provider =
          //             Provider.of<GoogleSignInProvider>(context, listen: false);
          //         provider.login();
          //         if (provider.isSigningIn) {
          //           return buildLoading();
          //         } else if (snapshot.hasData) {
          //           return LoggedInWidget();
          //         }
          //         else
          //         return RaisedButton(
          //             color: Theme.of(context).accentColor,
          //             child: Text("Google Sign in"),
          //             onPressed: () {
          //               auth.createUserWithEmailAndPassword(
          //                   email: _email, password: _password);
          //               Navigator.of(context)
          //                   .pushReplacement((MaterialPageRoute(
          //                 builder: (context) => SignUpWidget(),
          //               )));
          //             });
          //       }),
          // ),
        ],
      ),
    );
  }

  Widget buildLoading() => Center(child: CircularProgressIndicator());
}
