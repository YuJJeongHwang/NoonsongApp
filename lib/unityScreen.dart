import 'dart:typed_data';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';


class UnityScreen extends StatefulWidget {
  @override
  _UnityScreenState createState() => _UnityScreenState();
}

class CustomPopupMenu {
  CustomPopupMenu({this.title, this.scene});

  String title;
  int scene;
}

List<CustomPopupMenu> choices = <CustomPopupMenu>[
  CustomPopupMenu(title: 'AR Noonsong', scene: 0),
  //CustomPopupMenu(title: 'Noonsong Face', scene: 1),
];

class _UnityScreenState extends State<UnityScreen> {
  int counter = 0;
  Uint8List capturedImage;

  ScreenshotController screenshotController = ScreenshotController();

  var globalKey = new GlobalKey();
  //static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  UnityWidgetController _unityWidgetController;


  /*CustomPopupMenu _selectedChoices = choices[0];

  void _select(CustomPopupMenu choice) {
    setState(() {
      _selectedChoices = choice;
    });

    print('Selected');

    /*_unityWidgetController.postMessage(
      'GameManager',
      'LoadGameScene',
      choice.scene.toString(),
    );*/

  }*/

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        /*actions: <Widget>[
          PopupMenuButton<CustomPopupMenu>(
            elevation: 0.0,
            initialValue: choices[0],
            onCanceled: () {
              print('You have not chossed anything');
            },
            tooltip: 'This is tooltip',
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.map((CustomPopupMenu choice) {
                return PopupMenuItem<CustomPopupMenu>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          ),
        ],*/
      ),
      body: Column(
        children: <Widget>[
          Screenshot(
            controller : screenshotController,
            key: globalKey,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.only(top:8, bottom: 8),
              child: SizedBox(
                height: 400,
                child: Container(
                  //padding: EdgeInsets.only(top: 8, bottom: 8),
                  /*: Card(
                    color: Colors.white,
                    elevation: 3.0,
                    margin: const EdgeInsets.all(8),
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),*/
                  child: Stack(
                    children: <Widget>[
                      Container(
                          color: Colors.red,
                        ),
                        /*child: UnityWidget(
                          onUnityCreated: onUnityCreated,
                            //isARScene: false,
                            //onUnityMessage: onUnityMessage,
                        ),
                      ),*/
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:[
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
                      'images/눈송이ar.PNG',
                      width: 70,
                      height: 70,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      /*int scene = 1;
                      _unityWidgetController.postMessage(
                           'GameManager',
                           'LoadGameScene',
                           scene.toString(),
                      );*/
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
                ],
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.panorama_fish_eye, size: 40),
            onPressed: () async {
              //final image = await screenshotController.capture();
              screenshotController
                  .capture(delay: Duration(milliseconds: 10))
                  .then((capturedImage) async {
                ShowCapturedWidget(context, capturedImage);
              }).catchError((onError) {
                print(onError);
              });
              //if (image == null) return;
              //await saveImage(image);
            },
            //icon: Icons.panorama_fish_eye,

          ),
        ],
      )
    );
  }

  void onUnityMessage(controller, message) {
    print('Received message from unity: ${message.toString()}');
  }

  // Callback that connects the created controller to the unity controller
  void onUnityCreated(controller) {
    this._unityWidgetController = controller;
  }

  Future<dynamic> ShowCapturedWidget(
      BuildContext context, Uint8List capturedImage) {

    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text("Captured widget screenshot"),
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
              child: capturedImage != null
                  ? Image.memory(capturedImage)
                  : Container(),
            ),
            Container(
              child: SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                  child: Icon(Icons.save_alt),
                  onPressed: () {
                    final image = capturedImage;
                    saveImage(image);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    primary: Colors.white12,
                    onPrimary: Color.fromRGBO(13, 45, 132, 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> saveImage(Uint8List bytes) async {
    await [Permission.storage].request();

    final time = DateTime.now()
      .toIso8601String()
      .replaceAll('.', '-')
      .replaceAll(':', '-');
    final name = 'screenshot_$time';
    final result = await ImageGallerySaver.saveImage(bytes, name: name);

    return result['filePath'];
  }
}

