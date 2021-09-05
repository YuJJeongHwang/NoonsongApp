import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double widgetHeight = MediaQuery.of(context).size.height;
    double widgetWidth = MediaQuery.of(context).size.width - 60;

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
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  '로그인',
                  style: TextStyle(
                      fontSize: 30,
                      color: Color.fromRGBO(13, 45, 132, 1),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cafe24Ssurround'),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '이메일',
                    prefixIcon: Icon(Icons.perm_identity),
                  ),
                  validator: (value) {
                    if (!value.contains('@')) {
                      return '이메일을 입력해주세요';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: TextFormField(
                    controller: _password,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '****',
                      prefixIcon: Icon(Icons.vpn_key),
                    ),
                  )),
              Container(
                  padding: EdgeInsets.only(top: 30, left: 30, bottom: 30),
                  child: SizedBox(
                      width: widgetWidth,
                      height: 45,
                      child: ElevatedButton(
                          onPressed: () {
                            _logIn(_email.text, _password.text);
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            primary: Color.fromRGBO(13, 45, 132, 1),
                            onPrimary: Colors.white,
                          ),
                          child: Text(
                            '로그인',
                            style: TextStyle(
                                fontSize: 20, fontFamily: 'Cafe24Ssurround'),
                          ))))
            ],
          ),
        ),
      ),
    );
  }

  void _logIn(String text, String text2) {
    User user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      print("Login Sucessfull");

      Navigator.pushNamed(context, '/m');
    } else {
      print("Login Failed");
    }
  }
}
