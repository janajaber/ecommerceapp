import 'package:flutter/material.dart';
import 'package:test/login.dart';
import 'package:test/signup.dart';

class AuthWrapper extends StatefulWidget {
  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool _showSignIn = true;

  void _toggleView() {
    setState(() {
      _showSignIn = !_showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showSignIn) {
      return SignInPage(toggleView: _toggleView);
    } else {
      return SignUpPage(toggleView: _toggleView);
    }
  }
}