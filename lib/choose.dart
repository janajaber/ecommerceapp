// ignore: file_names
import 'package:flutter/material.dart';
import 'package:test/login.dart';
import 'package:test/signup.dart';

class ChooseSignInorSignUp extends StatelessWidget {
  const ChooseSignInorSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 100.0)),
                  const Text(
                    'Shoes',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Sans",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                        height: 130, child: Image.asset('logo2.png')),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 50.0)),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin:
                  const EdgeInsets.symmetric(horizontal: 100.0, vertical: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Color.fromARGB(255, 13, 120, 220),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(PageRouteBuilder(
                      pageBuilder: (_, __, ___) => SignInPage(toggleView: () {  },)));
                },
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.black,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                  ),
                ),
                const Text(
                  " Or ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 0.2,
                      fontFamily: 'Sans',
                      fontSize: 17.0),
                ),
                Container(
                  color: Colors.black,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              margin:
                  const EdgeInsets.symmetric(horizontal: 100.0, vertical: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: const Color.fromARGB(255, 13, 120, 220),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(PageRouteBuilder(
                      pageBuilder: (_, __, ___) => SignUpPage(toggleView: () {  },)));
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
