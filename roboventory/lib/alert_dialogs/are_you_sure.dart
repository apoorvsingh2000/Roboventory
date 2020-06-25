import 'package:flutter/material.dart';

class AreYouSure extends StatelessWidget {
  final String confirmText;

  AreYouSure(this.confirmText);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: Colors.black54,
      content: Text(
        confirmText,
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        cancelButton,
        SizedBox(width: MediaQuery.of(context).size.width * 0.07),
        proceedButton,
        SizedBox(width: MediaQuery.of(context).size.width * 0.05),
      ],
    );
  }

  final cancelButton = FlatButton(
    onPressed: () {},
    child: Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.orangeAccent,
      ),
      child: Text(
        'Cancel',
        style: TextStyle(color: Colors.white),
      ),
    ),
  );

  final proceedButton = FlatButton(
    onPressed: () {},
    child: Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.orangeAccent,
      ),
      child: Text(
        'Proceed',
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}
