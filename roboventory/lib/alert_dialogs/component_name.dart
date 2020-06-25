import 'package:flutter/material.dart';
import 'package:roboventory/utilities/constants.dart';

class ComponentName extends StatelessWidget {
  final String componentName, description;
  final bool available;

  ComponentName(this.componentName, this.description, this.available);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: Colors.black54,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            componentName,
            style: TextStyle(
                color: Colors.white, fontSize: screenWidth(context) * largeFont),
          ),
          Text(
            description,
            style: TextStyle(
                color: Colors.white, fontSize: screenWidth(context) * smallFont),
          ),
          Text(
            available == true ? 'Available' : 'Not Available',
            style: TextStyle(
                color: Colors.blue, fontSize: screenWidth(context) * smallFont),
          ),
        ],
      ),
      actions: <Widget>[
        deleteButton,
        SizedBox(width: MediaQuery.of(context).size.width * 0.07),
        editButton,
        SizedBox(width: MediaQuery.of(context).size.width * 0.05),
      ],
    );
  }

  final deleteButton = FlatButton(
    onPressed: () {},
    child: Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.orangeAccent,
      ),
      child: Text(
        'DELETE',
        style: TextStyle(color: Colors.white),
      ),
    ),
  );

  final editButton = FlatButton(
    onPressed: () {},
    child: Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.orangeAccent,
      ),
      child: Text(
        '   EDIT   ',
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
}
