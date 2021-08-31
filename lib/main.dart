import 'package:flutter/material.dart';
import 'package:unity_noonsong/unityScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Named Routes Demo',
    initialRoute: '/',
    routes: {
      '/': (context) => UnityScreen(),
    }
  ));
}
