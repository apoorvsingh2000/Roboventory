import 'package:flutter/material.dart';
import 'file:///C:/Users/apoor/AndroidStudioProjects/roboventory/lib/alert_dialogs/component_name.dart';
import 'package:roboventory/utilities/constants.dart';
import 'package:roboventory/widgets/fab.dart';
import 'file:///C:/Users/apoor/AndroidStudioProjects/roboventory/lib/alert_dialogs/fab_admin_components.dart';

class AdminCatalogue extends StatelessWidget {
  static const String id = 'admin_catalogue_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Fab(AddComponent(), Colors.blue),
      appBar: AppBar(
        title: Text('Catalogue'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) =>
                      ComponentName('componentName', 'description', true),
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
