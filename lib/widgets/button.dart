import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final Function() onPressed;
  final Widget child;

  ButtonCustom({this.onPressed, this.child});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(onPressed: onPressed, child: child);
  }
}
