import 'package:flutter/material.dart';
import 'package:roboventory/alert_dialogs/component_history.dart';
import 'package:roboventory/utilities/constants.dart';

class AdminHistory extends StatelessWidget {
  static const String id = 'admin_history_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => ComponentHistory('Component Name here'),
                );
              },
              child: Card(
                elevation: 5.0,
                color: Colors.grey[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Image.asset('images/ir.png'),
                    Text(
                      'IR Sensor',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth(context) * smallFont),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
}
