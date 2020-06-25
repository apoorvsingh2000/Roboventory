import 'package:flutter/material.dart';
import 'file:///C:/Users/apoor/AndroidStudioProjects/roboventory/lib/widgets/user/user_pending_list_item.dart';

class HomePending extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, position) {
      return PendingListItem();
    });
  }
}
