import 'package:flutter/material.dart';
import 'package:connectpamodziv04/screens/Authenticate/register_screen.dart';
import 'login_screen.dart';

class Welcome extends StatefulWidget {
  static const String id = 'welcome';

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  FlutterLogo flutterLogo = const FlutterLogo();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            flutterLogo,
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: MaterialButton(
                // onPressed: () {
                //   null
                // },
                child: Hero(
                  tag: 'logo',
                  child: Text(
                    'Connect Pamodzi',
                    style: TextStyle(
                      fontFamily: "Signatra",
                      fontSize: 90.0,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 20.0),
                    child: Container(
                      // padding: EdgeInsets.fromLTRB(20.0, 20.0, 50.0, 10.0),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Colors.purple,
                            Colors.deepPurple,
                            Colors.tealAccent
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.topLeft,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.id);
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Center(
                      child: Row(
                        children: <Widget>[
                          const Expanded(
                            child: Divider(
                              thickness: 2.0,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'OR',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          const Expanded(
                            child: Divider(
                              thickness: 2.0,
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Register.id);
                            },
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: MaterialButton(
                        //onPressed: () {
                         // Navigator.pushNamed(context, Register.id);
                        //},
                        child: Text(
                          'Sign up with Email',
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
