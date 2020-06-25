import 'package:flutter/material.dart';
import 'package:roboventory/utilities/constants.dart';

class BorrowedListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
          vertical: screenWidth(context) * 0.01,
          horizontal: screenWidth(context) * 0.04),
      height: screenHeight(context) * 0.17,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        color: Colors.grey[300],
        child: Row(
          children: <Widget>[
            Image.asset(
              'images/ir.png',
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: screenWidth(context) * largeFont,
            ),
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
  }

  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
}
