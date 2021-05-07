import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hla/widgets/canvas.dart';

class GamePage extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Container(
        width: width,
        height: height,
        child: Row(
          children: [
            Container(
                child: Column(
              children: <Widget>[
                Container(height: height, width: width, child: CanvasWidget())
              ],
            )),
          ],
        ));
  }
}

