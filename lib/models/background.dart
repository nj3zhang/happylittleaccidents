import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackgroundImg extends StatelessWidget {
  BackgroundImg();

  @override
  Widget build(BuildContext context) {
    return Container(
        // Background
        decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage("lib/images/background.jpg"), fit: BoxFit.cover),
    ));
  }
}
