import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roboventory/components/user/user_home_drawer.dart';
import 'package:roboventory/components/user/user_home_borrowed.dart';
import 'package:roboventory/components/user/user_home_pending.dart';

class UserHome extends StatelessWidget {
  static const String id = 'user_home_screen';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 10.0,
            title: Text('Roboventory'),
            bottom: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              indicator: BoxDecoration(color: Colors.white),
              tabs: [
                Tab(text: 'Borrowed'),
                Tab(text: 'Pending Requests'),
              ],
            ),
          ),
          drawer: userHomeDrawer(context),
          body: TabBarView(
            children: [
              HomeBorrowed(),
              HomePending(),
            ],
          ),
        ),
      ),
    );
  }

  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
}
