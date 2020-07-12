import 'package:flutter/material.dart';
import 'package:roboventory/components/admin/admin_component_item.dart';
import 'package:roboventory/widgets/fab.dart';
import 'package:roboventory/alert_dialogs/fab_admin_components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;

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
      body: ComponentsStream(),
    );
  }
}

class ComponentsStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('components').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.orangeAccent,
            ),
          );
        }
        final components = snapshot.data.documents;
        List<ComponentItem> componentList = [];
        for (var component in components) {
          final name = component.data['name'];
          print(name);
          final description = component.data['description'];
          final quantity = component.data['quantity'];
          final price = component.data['price'];
          final imageURL = component.data['imageURL'];
          final ComponentItem item =
              ComponentItem(name, description, price, quantity, imageURL);

          componentList.add(item);
        }
        return GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          children: componentList,
        );
      },
    );
  }

  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
}
