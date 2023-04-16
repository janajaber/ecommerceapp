// ignore: file_names
import 'package:flutter/material.dart';
import 'package:test/signup.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'main.dart';

//import 'package:test/signup.dart';
class SignInPage extends StatefulWidget {
  final VoidCallback toggleView;

  SignInPage({required this.toggleView});

  @override
  // ignore: no_logic_in_create_state
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isButtonEnabled = true;

  @override
  void initState() {
    super.initState();
    _isButtonEnabled = false;
  }

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
                      'Sign In',
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
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.all(2.0)),
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
                    Navigator.of(context).pushReplacement(PageRouteBuilder(
                        pageBuilder: (BuildContext context, _, __) =>
                            HomePage()));
                    //widget.toggleView();},
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 1),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                    ),
                  ),
                ],
              ),
              InkWell(
                  onTap: () {
                    /*widget.toggleView();*/
                  },
                  child: const buttonCustomGoogle()),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(PageRouteBuilder(
                        pageBuilder: (BuildContext context, _, __) =>
                            SignUpPage(
                              toggleView: () {},
                            )));
                  },
                  child: const Text(
                    "Do Not have account? Sign up!",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Popins"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class buttonCustomGoogle extends StatelessWidget {
  const buttonCustomGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 10.0),
      child: Container(
        alignment: FractionalOffset.center,
        height: 49.0,
        width: 500.0,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 0, 0),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10.0)],
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(left: 0.0)),
            Image.asset(
              "google.png",
              height: 25.0,
            ),
            const Text(
              "With Google",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 7.0)),
          ],
        ),
      ),
    );
  }
}
