import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roboventory/components/admin/admin_home_drawer.dart';

class AdminHome extends StatelessWidget {
  static const String id = 'home_screen';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orangeAccent,
            elevation: 10.0,
            title: Text('Roboventory'),
          ),
          drawer: adminHomeDrawer(context),
          body: Container(),
        ),
      ),
    );
  }

  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
}
