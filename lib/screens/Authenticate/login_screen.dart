import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:connectpamodziv04/screens/Authenticate/register_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../../nav.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FlutterLogo flutterLogo = FlutterLogo(
    size: 30,
  );
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: const BoxConstraints(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  flutterLogo,
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Hero(
                      tag: 'logo',
                      child: Text(
                        'Connect Pamodzi',
                        style: TextStyle(
                          fontFamily: "Signatra",
                          fontSize: 90.0,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100.0,
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            email = value;
                            //Do something with the user input.
                          },
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.tealAccent,
                            hoverColor: Colors.deepPurpleAccent,
                            hintText: 'Enter your email',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.purple, width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.purple, width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          obscureText: true,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            password = value;
                            //Do something with the user input.
                          },
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.tealAccent,
                            hoverColor: Colors.deepPurpleAccent,
                            hintText: 'Enter your password.',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.purple, width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.purple, width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50.0, vertical: 70.0),
                    child: Container(
                      // padding: EdgeInsets.fromLTRB(20.0, 20.0, 50.0, 10.0),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Colors.purple,
                            Colors.deepPurple,
                            Colors.blueAccent
                          ],
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      // padding: EdgeInsets.fromLTRB(20.0, 20.0, 50.0, 10.0),
                      child: TextButton(
                        onPressed: () async {
                          setState(() {
                            showSpinner = true;
                          });
                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                                email: email, password: password);
                            if (user != null) {
                              Navigator.pushNamed(context, Nav.id);
                            }
                          }
                          //Implement login functionality.
                          catch (e) {
                            print(e);
                          } finally {
                            showSpinner = false;
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Register.id);
                        },
                        child: const Text(
                          'Not a register user yet? Sign up with us today.',
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
