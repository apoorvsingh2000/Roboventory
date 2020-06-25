import 'package:flutter/material.dart';
import 'package:roboventory/widgets/user/user_borrowed_list_item.dart';

class HomeBorrowed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, position) {
      return BorrowedListItem();
    });
  }
}
