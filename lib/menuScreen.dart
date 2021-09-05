import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {

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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color:Colors.white,
            child: SizedBox(
              width: 200,
              height: 200,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/us');
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    width: 5.0,
                    color: Color.fromRGBO(13, 45, 132, 1),
                  ),
                ),
                child: Image.asset(
                    'images/character_new40.png',
                ),
              )
            )
          )
        ],
      )
    );
  }
}
