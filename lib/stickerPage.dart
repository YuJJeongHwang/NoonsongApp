import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stick_it/stick_it.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:typed_data';

class AdvancedExample extends StatefulWidget {
  //AdvancedExample({Key? key}) : super(key: key);
  static String routeName = 'advanced-example';
  static String routeTitle = 'Advanced Example';

  @override
  _AdvancedExampleState createState() => _AdvancedExampleState();
}

class _AdvancedExampleState extends State<AdvancedExample> {
  /// background image of the stick it class
  final String _background =
      'https://blogfiles.pstatic.net/MjAyMTA5MDhfMjIy/MDAxNjMxMDMxOTQzNjkw.Bl2g4eBBOM7s3bPKs_rJWHkHoWdfDS1pGd1QepgzO1Ug.1f1DP8HqOQTQEVKyhl8ajpSJtF_gEEhD9i7rkKqLQhog.JPEG.ksyy0704/IMG_3508.JPG';

  /// used for getting images either from gallery or camera
  final _picker = ImagePicker();

  /// reference used for calling the exportImage function
  StickIt _stickIt;

  /// the image picked by a user as file
  File _image;

  @override
  Widget build(BuildContext context) {
    double bottomPadding = MediaQuery.of(context).size.height / 4;
    double rightPadding = MediaQuery.of(context).size.width / 12;
    double boxSize = 56.0;
    _stickIt = StickIt(
      child: _image == null ? Image.network(_background) : Image.file(_image, fit: BoxFit.cover),
      stickerList: [
        Image.asset("assets/character_new01.gif"),
        Image.asset("assets/character_new02.gif"),
        Image.asset("assets/character_new03.gif"),
        Image.asset("assets/character_new04.gif"),
        Image.asset("assets/character_new05.gif"),
        Image.asset("assets/character_new06.gif"),
        Image.asset("assets/character_new07.gif"),
        Image.asset("assets/character_new08.gif"),
        Image.asset("assets/character_new09.gif"),
        Image.asset("assets/character_new10.gif"),
        Image.asset("assets/character_new11.gif"),
        Image.asset("assets/character_new12.gif"),
        Image.asset("assets/character_new13.gif"),
        Image.asset("assets/character_new14.gif"),
        Image.asset("assets/character_new15.gif"),
        Image.asset("assets/character_new16.gif"),
        Image.asset("assets/character_new17.gif"),
        Image.asset("assets/character_new18.gif"),
        Image.asset("assets/character_new19.gif"),
        Image.asset("assets/character_new20.gif"),
        Image.asset("assets/character_new21.gif"),
        Image.asset("assets/character_new22.gif"),
        Image.asset("assets/character_new23.gif"),
        Image.asset("assets/character_new24.gif"),
        Image.asset("assets/character_new25.gif"),
        Image.asset("assets/character_new26.gif"),
        Image.asset("assets/character_new27.gif"),
        Image.asset("assets/character_new28.gif"),
        Image.asset("assets/character_new30.gif"),
        Image.asset("assets/character_new31.gif"),
        Image.asset("assets/character_new32.gif"),
        Image.asset("assets/character_new33.gif"),
        Image.asset("assets/character_new34.gif"),
        Image.asset("assets/character_new35.gif"),
        Image.asset("assets/character_new36.gif"),
        Image.asset("assets/character_new37.gif"),
        Image.asset("assets/character_new38.gif"),
        Image.asset("assets/character_new39.gif"),
        Image.asset("assets/character_new40.gif"),
        Image.asset("assets/character_new41.gif"),
        Image.asset("assets/character_new42.gif"),
        Image.asset("assets/character_new43.gif"),
        Image.asset("assets/character_new44.gif"),
        Image.asset("assets/character_new45.gif"),
        Image.asset("assets/character_new46.gif"),
      ],
      key: UniqueKey(),
      panelHeight: 175,
      panelBackgroundColor: Colors.white,
      panelStickerBackgroundColor: Colors.white,
      stickerSize: 100,
    );

    return Scaffold(
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
      body: Stack(
        children: [
          _stickIt,
          Positioned(
            bottom: bottomPadding,
            right: rightPadding,
            child: Column(
              children: [
                IconButton(
                  onPressed: () async {
                    Uint8List image = await _stickIt.exportImage();

                    Map<Permission, PermissionStatus> statuses = await [
                      Permission.location,
                      Permission.storage,
                    ].request();
                    print(statuses[Permission.location]);
                    await ImageGallerySaver.saveImage(image);
                  },
                  //color: Color.fromRGBO(13, 45, 132, 1),
                  icon: Icon(
                    Icons.check,
                    color: Color.fromRGBO(13, 45, 132, 1),
                    size: 36,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                IconButton(
                  onPressed: () {
                    generateModal(context);
                  },
                  icon: Icon(
                    Icons.camera,
                    color: Color.fromRGBO(13, 45, 132, 1),
                  ),
                  color: Theme.of(context).primaryColorDark,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future getImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      print('No image selected.');
    }
  }

  void generateModal(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 128,
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: () {
                      getImage(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.photo,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          child: Text('Select img from gallery'),
                          width: 200,
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 2,
                  indent: 64,
                  endIndent: 64,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      getImage(ImageSource.camera);
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          child: Text('Select img from camera'),
                          width: 200,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
