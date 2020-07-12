import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:roboventory/screens/admin/admin_home.dart';
import 'package:roboventory/screens/user/user_home.dart';
import 'package:roboventory/utilities/constants.dart';

class Login extends StatelessWidget {
  static const String id = 'login_screen';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _auth.signInWithEmailAndPassword(
              email: 'apoorv@email.com', password: 'aaaaaa');
          Navigator.pushNamed(context, AdminHome.id);
        },
        backgroundColor: Colors.orangeAccent,
      ),
      appBar: AppBar(
        title: Text('Roboventory'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background_2.png'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                width: double.infinity,
                height: screenHeight(context) * 0.5,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(screenHeight(context) * 0.025),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Hello,',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth(context) * largeFont)),
                      SizedBox(height: screenHeight(context) * 0.01),
                      Text('Sign in to continue',
                          style: TextStyle(
                              color: Color(0xff42A7F1),
                              fontSize: screenWidth(context) * smallFont)),
                      SizedBox(height: screenHeight(context) * 0.05),
                      Card(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Image.asset(
                              'images/logo_2.png',
                              height: screenHeight(context) * 0.01,
                            ),
                            hintText: 'Username',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight(context) * 0.025),
                      Card(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.vpn_key),
                            hintText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: screenWidth(context) * 0.28,
              bottom: screenHeight(context) * 0.155,
              child: FlatButton(
                onPressed: () {
                  _auth.signInWithEmailAndPassword(
                      email: 'apoorv@email.com', password: 'aaaaaa');
                  Navigator.pushNamed(context, UserHome.id);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: screenHeight(context) * 0.08,
                  width: screenWidth(context) * 0.35,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontSize: screenWidth(context) * 0.06),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
}
