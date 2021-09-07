import 'package:flutter/material.dart';

import 'package:unity_noonsong/homeScreen.dart';
import 'package:unity_noonsong/signInPage.dart';
import 'package:unity_noonsong/signUpPage.dart';
import 'package:unity_noonsong/splashScreen.dart';
import 'package:unity_noonsong/stickerPage.dart';
import 'package:unity_noonsong/unityScreen.dart';
import 'package:unity_noonsong/userInfoPage.dart';


import 'homeScreen.dart';
import 'menuScreen.dart';

void main() {
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
      '/ui': (context) => UserInfoPage(),
      '/st': (context) => StickerPage(),
    }
  ));
}
