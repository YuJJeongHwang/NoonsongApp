import 'dart:typed_data';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class UnityScreen extends StatefulWidget {
  @override
  _UnityScreenState createState() => _UnityScreenState();
}

class _UnityScreenState extends State<UnityScreen> {
  int counter = 0;
  Uint8List capturedImage;

  var globalKey = new GlobalKey();

  UnityWidgetController _unityWidgetController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double widgetHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            padding: EdgeInsets.only(top: 5, left: 10),
            color: Color.fromRGBO(13, 45, 132, 1),
            icon: Icon(Icons.arrow_back_ios, size: 40),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: SizedBox(
                height: widgetHeight - 200,
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: UnityWidget(
                          onUnityCreated: onUnityCreated,
                          //isARScene: false,
                          //onUnityMessage: onUnityMessage,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        int scene = 0;
                        _unityWidgetController.postMessage(
                          'GameManager',
                          'LoadGameScene',
                          scene.toString(),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        primary: Colors.white,
                      ),
                      child: Image.asset(
                        'images/snowar.png',
                        width: 70,
                        height: 70,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        int scene = 1;
                        _unityWidgetController.postMessage(
                          'GameManager',
                          'LoadGameScene',
                          scene.toString(),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        primary: Colors.white,
                      ),
                      child: Image.asset(
                        'images/bluesnowar.png',
                        width: 70,
                        height: 70,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        int scene = 2;
                        _unityWidgetController.postMessage(
                          'GameManager',
                          'LoadGameScene',
                          scene.toString(),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        primary: Colors.white,
                      ),
                      child: Image.asset(
                        'images/레이어 2.png',
                        width: 70,
                        height: 70,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        int scene = 3;
                        _unityWidgetController.postMessage(
                          'GameManager',
                          'LoadGameScene',
                          scene.toString(),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        primary: Colors.white,
                      ),
                      child: Image.asset(
                        'images/greennoonsong.png',
                        width: 70,
                        height: 70,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        int scene = 4;
                        _unityWidgetController.postMessage(
                          'GameManager',
                          'LoadGameScene',
                          scene.toString(),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        primary: Colors.white,
                      ),
                      child: Image.asset(
                        'images/character_new40.png',
                        width: 70,
                        height: 70,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        int scene = 5;
                        _unityWidgetController.postMessage(
                          'GameManager',
                          'LoadGameScene',
                          scene.toString(),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        primary: Colors.white,
                      ),
                      child: Image.asset(
                        'images/noonsonghairband.png',
                        width: 70,
                        height: 70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  void onUnityMessage(controller, message) {
    print('Received message from unity: ${message.toString()}');
  }

  // Callback that connects the created controller to the unity controller
  void onUnityCreated(controller) {
    this._unityWidgetController = controller;
  }
}
