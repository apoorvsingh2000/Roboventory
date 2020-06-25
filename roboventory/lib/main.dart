import 'package:flutter/material.dart';
import 'package:roboventory/screens/admin/admin_catalogue.dart';
import 'package:roboventory/screens/admin/admin_history.dart';
import 'package:roboventory/screens/admin/admin_home.dart';
import 'package:roboventory/screens/user/user_catalogue_screen.dart';
import 'package:roboventory/screens/user/user_home.dart';
import 'package:roboventory/screens/login.dart';
import 'package:roboventory/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Splash.id: (context) => Splash(),
        Login.id: (context) => Login(),
        UserHome.id: (context) => UserHome(),
        AdminHome.id: (context) => AdminHome(),
        UserCatalogue.id: (context) => UserCatalogue(),
        AdminCatalogue.id: (context) => AdminCatalogue(),
        AdminHistory.id: (context) => AdminHistory(),
      },
      initialRoute: Splash.id,
    );
  }
}
