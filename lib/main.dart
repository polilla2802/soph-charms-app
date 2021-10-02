import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:soph_charms_app/app/provider/google_sign_in.dart';
import 'package:soph_charms_app/presentation/screens/splash/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Map<int, Color> color = {50: const Color.fromRGBO(136, 14, 79, .1)};
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
          title: 'Soph Charms',
          theme: ThemeData(
              fontFamily: '70s',
              visualDensity: VisualDensity.adaptivePlatformDensity),
          home: const SplashScreen()));
}
