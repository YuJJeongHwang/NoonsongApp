import 'package:flutter/material.dart';

class NoonsongHomepage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double widgetHeight = MediaQuery.of(context).size.height;
    double widgetWidth = MediaQuery.of(context).size.width-60;
    return Material(
      color: Colors.white,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: double.infinity),
            Container(
              padding: EdgeInsets.only(top: widgetHeight/4),
              child: Text(
                'NoonSong App',
                style: TextStyle(
                  fontSize: 43,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Cafe24Ssurround",
                  color: Color.fromRGBO(13, 45, 132, 1),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: widgetHeight/32, bottom: widgetHeight/25),
              child: Image.asset(
                  'images/character_new40.png',
                  width: widgetWidth-50,
                  height: widgetHeight/3,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: SizedBox(
                height: widgetHeight/20,
                width: widgetWidth,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context,'/i');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(13, 45, 132, 1),
                    onPrimary: Colors.white,
                  ),
                  child: Text(
                    '로그인',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: "Cafe24Ssurround",
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: SizedBox(
                height: widgetHeight/20,
                width: widgetWidth,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context,'/u');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                  ),
                  child: Text(
                    '회원가입',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: "Cafe24Ssurround",
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
