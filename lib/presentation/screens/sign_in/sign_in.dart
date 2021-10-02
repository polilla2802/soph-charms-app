import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:soph_charms_app/app/provider/google_sign_in.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

Future<void> _signInWithGoogle(BuildContext context) async {
  final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
  await provider.googleLogIn();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(163, 208, 241, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(254, 202, 250, 1),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.

        title: FittedBox(
            alignment: Alignment.centerLeft,
            fit: BoxFit.scaleDown,
            child: RichText(
              text: const TextSpan(
                  style: TextStyle(
                      fontFamily: "70s",
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: "Whatever",
                        style:
                            TextStyle(color: Color.fromRGBO(255, 195, 36, 1))),
                    TextSpan(
                        text: " today",
                        style:
                            TextStyle(color: Color.fromRGBO(222, 128, 93, 1))),
                    TextSpan(
                        text: " brings,",
                        style:
                            TextStyle(color: Color.fromRGBO(197, 148, 173, 1))),
                    TextSpan(
                        text: " you",
                        style:
                            TextStyle(color: Color.fromRGBO(112, 172, 164, 1))),
                    TextSpan(
                        text: " got",
                        style:
                            TextStyle(color: Color.fromRGBO(255, 195, 36, 1))),
                    TextSpan(
                        text: " this",
                        style:
                            TextStyle(color: Color.fromRGBO(222, 128, 93, 1))),
                    TextSpan(
                        text: "!",
                        style:
                            TextStyle(color: Color.fromRGBO(197, 148, 173, 1)))
                  ]),
            )),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 64),
              child: Image.asset(
                "assets/logo/soph_charms_logo.png",
                width: 200,
              ),
            ),
            Container(
              child: ElevatedButton.icon(
                  icon: Container(
                    padding: const EdgeInsets.only(right: 8),
                    child: const FaIcon(
                      FontAwesomeIcons.google,
                      color: Color.fromRGBO(112, 172, 164, 1),
                    ),
                  ),
                  onPressed: () async {
                    await _signInWithGoogle(context);
                  },
                  label: RichText(
                    text: const TextSpan(
                        style: TextStyle(
                            fontFamily: "70s",
                            fontWeight: FontWeight.bold,
                            fontSize: 23),
                        children: [
                          TextSpan(
                              text: "Accede ",
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 195, 36, 1))),
                          TextSpan(
                              text: "con ",
                              style: TextStyle(
                                  color: Color.fromRGBO(222, 128, 93, 1))),
                          TextSpan(
                              text: "google",
                              style: TextStyle(
                                  color: Color.fromRGBO(197, 148, 173, 1))),
                        ]),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: const Color.fromRGBO(45, 52, 54, 1),
                      minimumSize: const Size(double.infinity, 50))),
            )
          ],
        ),
      ),
    );
  }
}
