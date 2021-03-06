import 'package:flutter/material.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: 175,
              child: Text(
                "Welcome Back To MY App",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Spacer(),
          SizedBox(height: 12),
          Text(
            'Login To Continue',
            style: TextStyle(fontSize: 16),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
