import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';

class MenuScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    double midHeight = MediaQuery.of(context).size.height/2;
    double midWidth = MediaQuery.of(context).size.width/2;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        //iconTheme: new IconThemeData(size: 40, color: Colors.indigo[900],),
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
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(top: 5, right: 10),
            color: Color.fromRGBO(13, 45, 132, 1),
            icon: Icon(Icons.menu, size: 40),
            onPressed: () {
              _scaffoldKey.currentState.openEndDrawer();
              },
          ),
        ],
      ),
      endDrawer: new Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/character_new40.png'),
                  backgroundColor: Colors.white,
                ),
                accountName: Text(
                  '눈송',
                  style: TextStyle(
                    fontFamily: 'Cafe24SsurroundAir',
                  ),
                ),
                accountEmail: Text(
                  'noonsoon@sookmyung.ac.kr',
                  style: TextStyle(
                    fontFamily: 'Cafe24SsurroundAir',
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(13, 45, 132, 1),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Color.fromRGBO(13, 45, 132, 1),
                  size: 30,
                ),
                title: Text(
                  '설정',
                  style: TextStyle(
                    fontFamily: 'Cafe24Ssurround',
                    fontSize: 15,
                  ),
                ),
              ),
              ListTile(
                tileColor: Colors.black12,
                title: Text(
                  '계정 관리',
                  style: TextStyle(
                    fontFamily: 'Cafe24SsurroundAir',
                  ),
                ),
              ),
              ListTile(
                //tileColor: Colors.,
                title: Text(
                  '로그인 정보',
                  style: TextStyle(
                    fontFamily: 'Cafe24SsurroundAir',
                  ),
                ),
                onTap: () => Navigator.pushNamed(context, '/ui'),

              ),
              ListTile(
                tileColor: Colors.black12,
                title: Text(
                  '일반',
                  style: TextStyle(
                    fontFamily: 'Cafe24SsurroundAir',
                  ),
                ),
              ),
              ListTile(
                tileColor: Colors.white,
                title: Text(
                  '버전 정보 : 0.0.1',
                  style: TextStyle(
                    fontFamily: 'Cafe24SsurroundAir',
                  ),
                ),
                onTap:() {},
              ),
              ListTile(
                tileColor: Colors.white,
                title: Text(
                  '도움말',
                  style: TextStyle(
                    fontFamily: 'Cafe24SsurroundAir',
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity),
          Container(
              padding: EdgeInsets.only(left: midWidth - 160, top: 100),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    color:Colors.white,
                    child: SizedBox(
                        width: 150,
                        height: 150,
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
                            'images/character_new02.png',
                          ),
                        ),
                    ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  color:Colors.white,
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: OutlinedButton(
                      onPressed: () {
                        //Navigator.pushNamed(context, '/us');
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
                    ),
                  ),
                ),
              ],
            )
          ),
          Container(
              padding: EdgeInsets.only(left: midWidth - 160, top: 30),
            child: Row(
              children: [
                Container(
                    padding: EdgeInsets.only(right: 10),
                    color:Colors.white,
                    child: SizedBox(
                        width: 150,
                        height: 150,
                        child: OutlinedButton(
                          onPressed: () {
                            _noonsongGameStart();
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              width: 5.0,
                              color: Color.fromRGBO(13, 45, 132, 1),
                            ),
                          ),
                          child: Image.asset(
                            'images/character_new12.png',
                          ),
                        )
                    )
                ),
                Container(
                    padding: EdgeInsets.only(left: 10),
                    color:Colors.white,
                    child: SizedBox(
                        width: 150,
                        height: 150,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/st');
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              width: 5.0,
                              color: Color.fromRGBO(13, 45, 132, 1),
                            ),
                          ),
                          child: Image.asset(
                            'images/character_new12.png',
                          ),
                        )
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _noonsongGameStart() async {
    DeviceApps.openApp('com.mcicek.firebase_face_tracking');
  }
}
