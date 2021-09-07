import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:ui' as ui;

class StickerPage extends StatefulWidget {

  @override
  _StickerPageState createState() => _StickerPageState();
}

class _StickerPageState extends State<StickerPage> {

 final ImagePicker _picker = ImagePicker();
 PickedFile _image;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: _buildAppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: _getImage,
          child: Icon(Icons.add_a_photo),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              _image == null
                    ? Text('No image')
                    : Image.file(File(_image.path)),
              TextField(
                decoration: InputDecoration(hintText: '내용'),
              )
            ],
          ),
        )
    );
  }

  /*Widget _buildBody() {
    return Column
  }*/


  Future _getImage() async {
    PickedFile image = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }
}
