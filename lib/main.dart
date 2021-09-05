import 'package:flutter/material.dart';
import 'package:unity_noonsong/signInPage.dart';
import 'package:unity_noonsong/signUpPage.dart';
import 'package:unity_noonsong/splashScreen.dart';
import 'package:unity_noonsong/unityScreen.dart';

import 'homeScreen.dart';
import 'menuScreen.dart';

import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Noonsong App',
      initialRoute: '/',
      routes: {
        '/': (context) => MySplashScreen(),
        '/h': (context) => NoonsongHomepage(),
        '/u': (context) => SignUpPage(),
        '/i': (context) => SignInPage(),
        '/m': (context) => MenuScreen(),
        '/us': (context) => UnityScreen(),
      }));
}
