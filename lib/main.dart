import 'package:flutter/material.dart';
import 'package:unity_noonsong/unityScreen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Named Routes Demo',
    initialRoute: '/',
    routes: {
      '/': (context) => WithARkitScreen(),
    }
  ));
}
