import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soph_charms_app/presentation/screens/log_in/log_in.dart';
import 'package:soph_charms_app/presentation/screens/sign_in/sign_in.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.purple,
                ),
              );
            } else if (snapshot.hasData) {
              return const LoggedInScreen();
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Oops there was an error"),
              );
            }
            return const SignInScreen();
          },
        ),
      );
}
