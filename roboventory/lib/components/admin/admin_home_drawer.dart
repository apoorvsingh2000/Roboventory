import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roboventory/screens/admin/admin_catalogue.dart';
import 'package:roboventory/screens/admin/admin_history.dart';
import 'package:roboventory/utilities/constants.dart';

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

Drawer adminHomeDrawer(BuildContext context) {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          padding: EdgeInsets.only(
              top: screenHeight(context) * smallFont,
              bottom: 0.0,
              left: screenWidth(context) * smallFont * 0.75,
              right: screenWidth(context) * smallFont * 0.75),
          margin: EdgeInsets.only(
            top: screenHeight(context) * smallFont * 0.5,
          ),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  'Inventory',
                  style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: screenWidth(context) * 0.12),
                ),
                trailing: Icon(
                  Icons.home,
                  size: screenWidth(context) * 0.12,
                  color: Colors.orangeAccent,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    right: screenWidth(context) * largeFont,
                    left: screenWidth(context) * smallFont),
                height: screenHeight(context) * smallFont * 0.1,
                decoration: BoxDecoration(color: Colors.orangeAccent),
              ),
            ],
          ),
        ),
        NavTile(
          icon: Icon(Icons.history),
          text: 'History',
          onTap: () => Navigator.pushNamed(context, AdminHistory.id),
        ),
        NavTile(
          icon: Icon(CupertinoIcons.book_solid),
          text: 'Catalogue',
          onTap: () => Navigator.pushNamed(context, AdminCatalogue.id),
        ),
        NavTile(
          icon: Icon(Icons.monetization_on),
          text: 'Penalty',
        ),
        NavTile(
          icon: Icon(Icons.supervised_user_circle),
          text: 'Users',
        ),
        NavTile(
          icon: Icon(Icons.account_circle),
          text: 'Profile',
        ),
        NavTile(
          icon: Icon(Icons.exit_to_app),
          text: 'Logout',
          onTap: () => _auth.signOut(),
        ),
      ],
    ),
  );
}

class NavTile extends StatelessWidget {
  final String text;
  final Icon icon;
  final Function onTap;

  NavTile({this.text, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        leading: icon,
        title: Text(text),
        onTap: onTap,
      ),
    );
  }
}
