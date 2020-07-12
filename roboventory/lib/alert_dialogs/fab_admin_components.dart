import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:roboventory/components/admin/admin_home_drawer.dart';
import 'package:roboventory/utilities/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddComponent extends StatefulWidget {
  @override
  _AddComponentState createState() => _AddComponentState();
}

class _AddComponentState extends State<AddComponent> {
  final StorageReference storageReference = FirebaseStorage().ref();
  final Firestore _firestore = Firestore.instance;
  final picker = ImagePicker();
  File pickedImage;
  String componentName = '';
  String componentDescription = '';
  int quantity = 0;
  double price = 0;

  Future getImage() async {
    final image = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      pickedImage = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
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
            TextField(
              onChanged: (textValue) => componentName = textValue,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
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
                  'Price:',
                  style: whiteText,
                ),
                SizedBox(width: screenWidth(context) * 0.2),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (textValue) {
                      price = double.parse(textValue);
                      print(price);
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight(context) * 0.015),
            Text(
              'Add Image:',
              style: whiteText,
            ),
            SizedBox(height: screenHeight(context) * 0.05),
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                pickedImage == null
                    ? Container()
                    : Image.file(
                        pickedImage,
                        height: screenHeight(context) * 0.2,
                        fit: BoxFit.contain,
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
            SizedBox(height: screenHeight(context) * 0.05),
            Text(
              'Description:',
              style: whiteText,
            ),
            SizedBox(height: screenHeight(context) * 0.015),
            TextField(
              onChanged: (textValue) => componentDescription = textValue,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            SizedBox(height: screenHeight(context) * 0.05),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () async {
                  StorageUploadTask uploadTask = storageReference
                      .child('components')
                      .child('$componentName.jpg')
                      .putFile(pickedImage);
                  var imageURL = (await uploadTask.onComplete).ref.getDownloadURL();
                  _firestore.collection('components').add(
                    {
                      'name': componentName,
                      'description': componentDescription,
                      'price': price,
                      'quantity': quantity,
                      'imageURL': await imageURL,
                    },
                  );
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.all(screenWidth(context) * 0.03),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.orangeAccent,
                  ),
                  child: Text(
                    'Add Item',
                    style: TextStyle(
                      fontSize: screenWidth(context) * smallFont,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
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
