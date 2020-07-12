import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roboventory/utilities/constants.dart';

class PendingListItem extends StatelessWidget {
  final _accepted;
  final _date;
  final _imageURL;
  final _name;
  final _quantity;
  final _time;

  PendingListItem(this._accepted, this._date, this._imageURL, this._name,
      this._quantity, this._time);

  @override
  Widget build(BuildContext context) {
    if (_accepted == false) {
      return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(
            vertical: screenWidth(context) * 0.01,
            horizontal: screenWidth(context) * 0.04),
        height: screenHeight(context) * 0.18,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          color: Colors.grey[300],
          child: Stack(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.network(
                    _imageURL,
                    height: screenHeight(context) * 0.15,
                    width: screenWidth(context) * 0.3,
                  ),
                  SizedBox(
                    width: screenWidth(context) * largeFont,
                  ),
                  Text(
                    _name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth(context) * smallFont),
                  ),
                  SizedBox(
                    width: screenWidth(context) * 0.02,
                  ),
                  Text(
                    '($_quantity)',
                    style: TextStyle(fontSize: screenWidth(context) * smallFont),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else
      return Container();
  }

  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
}
