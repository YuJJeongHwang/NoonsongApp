import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'userInfoPage.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class UpdatePasswordPage extends StatefulWidget {
  @override
  _UpdatePasswordPageState createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _newpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double widgetHeight = MediaQuery.of(context).size.height;
    double widgetWidth = MediaQuery.of(context).size.width - 40;

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
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 60, left: 15),
                child: Text(
                  '비밀번호 변경',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Cafe24Ssurround',
                    color: Color.fromRGBO(13, 45, 132, 1),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, left: 20),
                child: Text(
                  '변경 전 비밀번호',
                  style:
                      TextStyle(fontSize: 17, fontFamily: 'Cafe24SsurroundAir'),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  height: 45,
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "비밀번호를 입력해주세요";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, left: 20),
                child: Text(
                  '새 비밀번호',
                  style:
                      TextStyle(fontSize: 17, fontFamily: 'Cafe24SsurroundAir'),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  height: 45,
                  child: TextFormField(
                    controller: _newpasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "비밀번호를 입력해주세요";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, left: 20),
                child: Text(
                  '새 비밀번호 확인',
                  style:
                      TextStyle(fontSize: 17, fontFamily: 'Cafe24SsurroundAir'),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  height: 45,
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    validator: (String value) {
                      if (value != _newpasswordController.text) {
                        return '비밀번호가 일치하지 않습니다.';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: SizedBox(
                  width: widgetWidth,
                  height: 45,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await _changePassword(_passwordController.text,
                              _newpasswordController.text);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        primary: Color.fromRGBO(13, 45, 132, 1),
                        onPrimary: Colors.white,
                      ),
                      child: Text(
                        '비밀번호 변경하기',
                        style: TextStyle(
                            fontSize: 20, fontFamily: 'Cafe24Ssurround'),
                      )),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 10, left: 20),
                  child: SizedBox(
                      width: 370,
                      height: 45,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            primary: Colors.white,
                            onPrimary: Colors.black,
                          ),
                          child: Text('')))),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _passwordController.dispose();
    _newpasswordController.dispose();
    super.dispose();
  }

  Future<void> _changePassword(
      String currentPassword, String newPassword) async {
    final User user = FirebaseAuth.instance.currentUser;
    final cred = EmailAuthProvider.credential(
        email: user.email, password: currentPassword);

    user.reauthenticateWithCredential(cred).then((value) {
      user.updatePassword(newPassword).then((_) {
        //Success, do something
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => UserInfoPage()));
      }).catchError((error) {
        //Error, show something
      });
    }).catchError((err) {});
  }
}
