import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signInPage.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

  bool _success;
  String _userEmail = '';

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
                  '회원가입',
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
                  '이름',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  height: 45,
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      //labelText: '이름',
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "이름을 입력해주세요";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, left: 20),
                child: Text(
                  '이메일',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  height: 45,
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "이메일을 입력해주세요";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              /*Container(
              padding: EdgeInsets.only(left: 20),
              child: SizedBox(
                height: 45,
                child: ElevatedButton(
                  onPressed: () {  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    primary: Colors.black12,
                    onPrimary: Colors.black,
                  ),
                  child: Text(
                    '인증코드 보내기',
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 20),
              child: Text(
                '이메일 인증코드',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Container(
                    child: SizedBox(
                      width: 250,
                      height: 45,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: SizedBox(
                      width: 120,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {  },
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          primary: Colors.black12,
                          onPrimary: Colors.black,
                        ),
                        child: Text(
                          '인증코드 확인',
                        ),
                      ),
                    )
                  ),
                ],
              ),
            ),*/
              Container(
                padding: EdgeInsets.only(top: 10, left: 20),
                child: Text(
                  '비밀번호',
                  style: TextStyle(
                    fontSize: 17,
                  ),
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
                  '비밀번호 확인',
                  style: TextStyle(
                    fontSize: 17,
                  ),
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
                      if (value != _passwordController) {
                        return null;
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
                          await _register();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        primary: Color.fromRGBO(13, 45, 132, 1),
                        onPrimary: Colors.white,
                      ),
                      child: Text(
                        '회원가입',
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
              Container(
                alignment: Alignment.center,
                child: Text(_success == null
                    ? ''
                    : (_success
                        ? 'Successfully registered $_userEmail'
                        : 'Registration failed')),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    final User user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignInPage()));
      });
    } else {
      _success = false;
    }
  }
}
