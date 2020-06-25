import 'package:flutter/material.dart';
import 'package:roboventory/screens/login.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatelessWidget {
  static const String id = 'splash`_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SplashScreen(
            seconds: 2,
            navigateAfterSeconds: Login(),
//            image: Image.asset('images/splash.jpeg'),
            loadingText: Text('Welcome!'),
          ),
        ],
      ),
    );
  }
}
