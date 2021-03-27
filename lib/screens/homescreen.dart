import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // this is how we are structuring our elements on the screen
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('Join Room'),
            onPressed: () {
              print('join room has been pressed');
            },
          ),
          RaisedButton(
            child: Text('Create Room'),
            onPressed: () {
              print('create room has been pressed');
            },
          )
        ],
      ),

    );
  }
}
