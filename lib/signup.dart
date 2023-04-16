import 'package:test/login.dart';
import 'package:test/auth_wrapper.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class SignUpPage extends StatefulWidget {
  final Function toggleView; // add this line

  SignUpPage({required this.toggleView}); // add this line

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 30.0)),
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: "Sans",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          height: 130, child: Image.asset('logo3.png')),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 16.0)),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      " Email",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Sans",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(8.0)),
                    SizedBox(
                      width: 350.0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            width: 2.0,
                          ),
                        ),
                        child: TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                          cursorColor: Colors.black,
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(8.0)),
                    const Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Sans",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(8.0)),
                    SizedBox(
                      width: 350.0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            width: 2.0,
                          ),
                        ),
                        child: TextField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                          cursorColor: Colors.black,
                          obscureText: true,
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(8.0)),
                    const Text(
                      "Repeat Password",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Sans",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(8.0)),
                    SizedBox(
                      width: 350.0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            width: 2.0,
                          ),
                        ),
                        child: TextField(
                          controller: _confirmPasswordController,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                          cursorColor: Colors.black,
                          obscureText: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.all(8.0)),

              Container(
                width: double.infinity,
                height: 55.0,
                margin: const EdgeInsets.symmetric(
                    horizontal: 100.0, vertical: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
                child: TextButton(
                  onPressed: () {
                    onPressed:
                    () {
                      Navigator.of(context).pushReplacement(PageRouteBuilder(
                          pageBuilder: (BuildContext context, _, __) =>
                              HomePage()));
                      //widget.toggleView();},
                    };
                    //  widget.toggleView();
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
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(PageRouteBuilder(
                        pageBuilder: (_, __, ___) => SignInPage(
                              toggleView: () {},
                            )));
                  },
                  child: const Text(
                    "Already Have an Account? Sign In!",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Popins"),
                  ),
                ),
              ),
              // const SizedBox(height: 16),
              // OutlinedButton(
              //   onPressed: () {
              //     // Navigate to sign up page
              //     // Navigator.of(context).pushReplacement(PageRouteBuilder(
              //     //     pageBuilder: (, _, _) => new SignUpPage()));
              //   },
              //   child: const Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              //     child: Text(
              //       'Sign Up',
              //       style: TextStyle(fontSize: 18),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
