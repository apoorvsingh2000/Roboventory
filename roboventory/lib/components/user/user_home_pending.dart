import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:roboventory/widgets/user/user_pending_list_item.dart';

class HomePending extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PendingStream();
  }
}

class PendingStream extends StatelessWidget {
  final Firestore _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('requests').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        List<PendingListItem> pendingList = [];
        var items = snapshot.data.documents;
        for (var item in items) {
          final name = item.data['name'];
          final date = item.data['date'];
          final imageURL = item.data['imageURL'];
          final accepted = item.data['accepted'];
          final quantity = item.data['quantity'];
          final time = item.data['time'];
          pendingList
              .add(PendingListItem(accepted, date, imageURL, name, quantity, time));
        }
        return ListView(
          children: pendingList,
        );
      },
    );
  }
}
