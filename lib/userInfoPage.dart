import 'package:flutter/material.dart';


class UserInfoPage extends StatefulWidget {

  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  @override
  Widget build(BuildContext context) {

    double midHeight = MediaQuery.of(context).size.height/2;
    double midWidth = MediaQuery.of(context).size.width/2;

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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: double.infinity),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: SizedBox(
                width: 150,
                height: 150,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/character_new40.png'),
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 40),
              child: Text(
                'noonsong@sookmyung.ac.kr',
                style: TextStyle(
                  fontFamily: 'Cafe24SsurroundAir',
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 50),
              child: TextButton(
                child: Text(
                  '비밀번호 변경',
                  style: TextStyle(
                    fontFamily: 'Cafe24SsurroundAir',
                    fontSize: 18,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5),
              child: TextButton(
                child: Text(
                  '회원 탈퇴하기',
                  style: TextStyle(
                    fontFamily: 'Cafe24SsurroundAir',
                    fontSize: 18,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
