import 'package:flutter/material.dart';

class UserCatalogue extends StatelessWidget {
  static const String id = 'user_catalog_screen';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Center(
        child: FlatButton(
          onPressed: () {
            var date = DateTime.now().toString().substring(0, 10);
            var time = DateTime.now().toString().substring(10, 16);
            print(date);
            print(time);
          },
          child: Text('Date & Time'),
          color: Colors.lightBlueAccent,
        ),
      ),
    );
  }
}
