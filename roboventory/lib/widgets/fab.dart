import 'package:flutter/material.dart';

class Fab extends StatelessWidget {
  final Widget onPressedCallback;
  final Color color;

  Fab(this.onPressedCallback, this.color);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: color,
      child: Icon(
        Icons.add,
        size: screenWidth(context) * 0.12,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => onPressedCallback,
        );
      },
    );
  }

  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
}
