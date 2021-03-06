import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  bool _isSigningIn;

  GoogleSignInProvider() {
    _isSigningIn = false;
    notifyListeners();
  }
  bool get isSigningIn => _isSigningIn;

  set isSigningIn(bool isSignedIn) {
    _isSigningIn = isSigningIn;
    notifyListeners();
  }

  Future login() async {
    isSigningIn = true;
    final user = await googleSignIn.signIn();
    if (user == null) {
      isSigningIn = false;
      return;
    }
  }
}
