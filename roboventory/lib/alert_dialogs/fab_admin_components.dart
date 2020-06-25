import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:roboventory/components/admin/admin_home_drawer.dart';
import 'package:roboventory/components/admin/admin_text_field.dart';
import 'package:roboventory/utilities/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddComponent extends StatefulWidget {
  @override
  _AddComponentState createState() => _AddComponentState();
}

class _AddComponentState extends State<AddComponent> {
  final picker = ImagePicker();
  File image;
  final _auth = FirebaseAuth.instance;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      image = File(pickedFile.path);
    });
  }

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
            'Component Name:',
            style: whiteText,
          ),
          SizedBox(height: screenHeight(context) * 0.015),
          AdminField(),
          SizedBox(height: screenHeight(context) * 0.015),
          Text(
            'Quantity:',
            style: whiteText,
          ),
          SizedBox(height: screenHeight(context) * 0.015),
          Row(
            children: <Widget>[
              FlatButton(
                onPressed: null,
                child: Counter(Icons.remove),
              ),
              Text(
                '1',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: screenWidth(context) * 0.075,
                ),
              ),
              FlatButton(
                onPressed: null,
                child: Counter(Icons.add),
              ),
            ],
          ),
          SizedBox(height: screenHeight(context) * 0.05),
          Row(
            children: <Widget>[
              Text(
                'Add Image:',
                style: whiteText,
              ),
              SizedBox(width: screenWidth(context) * 0.15),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    height: screenHeight(context) * 0.2,
                    child: image == null ? null : Image.file(image),
                  ),
                  FlatButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      getImage();
                    },
                    child: Counter(Icons.add_photo_alternate),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: screenHeight(context) * 0.05),
          Text(
            'Description:',
            style: whiteText,
          ),
          SizedBox(height: screenHeight(context) * 0.015),
          AdminField(),
        ],
      ),
    );
  }

  double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
}

class Counter extends StatelessWidget {
  final IconData icon;

  Counter(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: screenWidth(context) * 0.08,
      ),
    );
  }
}
