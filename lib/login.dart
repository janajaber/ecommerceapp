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
  // final _emailController = TextEditingController();
  // final _passwordController = TextEditingController();

  // bool _isButtonEnabled = true;

  // @override
  // void initState() {
  //   super.initState();
  //   _isButtonEnabled = false;
  // }

  final _formKey = GlobalKey<FormState>();

  bool _emailError = false;
  bool _passwordError = false;
  bool _emptyFieldsError = false;

  String _email = '';
  String _password = '';

  bool _isButtonEnabled = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _validateEmail(String email) {
    // A basic email validation regex
    final RegExp emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$");
    return emailRegex.hasMatch(email);
  }

  bool _validatePassword(String password) {
    // A basic password validation regex (minimum 8 characters, at least 1 uppercase letter, 1 lowercase letter, 1 number, and 1 special character)
    final RegExp passwordRegex = RegExp(
        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");
    return passwordRegex.hasMatch(password);
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
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                          cursorColor: Colors.black,
                          onChanged: (String value) {
                            if (value.isEmpty) {
                              setState(() {
                                _emailError = false;
                                _emptyFieldsError = true;
                              });
                            } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              setState(() {
                                _emailError = true;
                                _emptyFieldsError = false;
                              });
                            } else {
                              setState(() {
                                _emailError = false;
                                _emptyFieldsError = false;
                              });
                            }
                            _email = value;
                          },
                        ),
                      ),
                    ),
                    if (_emailError)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                        child: Text(
                          'Please enter a valid email address.',
                          style: TextStyle(color: Colors.red),
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
                        child: TextFormField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                          cursorColor: Colors.black,
                          obscureText: true,
                          onChanged: (String value) {
                            if (value.isEmpty) {
                              setState(() {
                                _passwordError = false;
                                _emptyFieldsError = true;
                              });
                            } else if (!RegExp(
                                    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$')
                                .hasMatch(value)) {
                              setState(() {
                                _passwordError = true;
                                _emptyFieldsError = false;
                              });
                            } else {
                              setState(() {
                                _passwordError = false;
                                _emptyFieldsError = false;
                              });
                            }
                            _password = value;
                          },
                        ),
                      ),
                    ),
                    if (_passwordError)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                        child: Text(
                          'Password must have at least 8 characters, 1 letter, and 1 number.',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    if (_emptyFieldsError)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                        child: Text(
                          'Please fill in both fields.',
                          style: TextStyle(color: Colors.red),
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
                    // Check if email or password fields are empty
                    if (_emailController.text.isEmpty ||
                        _passwordController.text.isEmpty ||
                        _emailError ||
                        _passwordError) {
                      setState(() {
                        _emptyFieldsError = true;
                      });
                    } else {
                      // If both fields are filled, navigate to the HomePage
                      Navigator.of(context).pushReplacement(
                        PageRouteBuilder(
                          pageBuilder: (BuildContext context, _, __) =>
                              HomePage(),
                        ),
                      );
                    }
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
