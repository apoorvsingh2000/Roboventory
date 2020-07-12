import 'package:flutter/material.dart';
import 'package:roboventory/alert_dialogs/component_name.dart';
import 'package:roboventory/utilities/constants.dart';

class ComponentItem extends StatelessWidget {
  final _name;
  final _description;
  final _price;
  final _imageURL;
  final _quantity;

  ComponentItem(
      this._name, this._description, this._price, this._quantity, this._imageURL);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => ComponentName(_name, _description, _quantity != 0),
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
            Image.network(
              _imageURL,
            ),
            Text(
              _name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth(context) * smallFont,
                backgroundColor: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }

  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
}
