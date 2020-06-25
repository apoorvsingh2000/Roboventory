import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:roboventory/components/user/user_home_drawer.dart';
import 'package:roboventory/utilities/constants.dart';

class ComponentHistory extends StatelessWidget {
  final String componentName;

  ComponentHistory(this.componentName);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: Colors.black54,
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              componentName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth(context) * largeFont,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: screenHeight(context) * 0.025,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Component', style: whiteTextBold),
                Text(
                  'No.',
                  style: whiteTextBold,
                ),
                Text(
                  'Date',
                  style: whiteTextBold,
                ),
                Text(
                  'Days',
                  style: whiteTextBold,
                ),
                SizedBox(
                  height: screenHeight(context) * 0.05,
                ),
              ],
            ),
            Column(
              children: <Widget>[
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
                HistoryRow(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: screenHeight(context) * 0.01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('abc sensor', style: whiteText),
            Text(
              '3',
              style: whiteText,
            ),
            Text(
              '15/01/2019',
              style: whiteText,
            ),
            Text(
              '25',
              style: whiteText,
            ),
          ],
        ),
      ],
    );
  }
}
