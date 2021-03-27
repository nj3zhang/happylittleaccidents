import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hla/screens/create_room.dart';
import 'package:hla/screens/join_room.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background.jpg"),
                fit: BoxFit.cover
            ),
        ),
      // this is how we are structuring our elements on the screen
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Join Room'),
              onPressed: () {
                print('join room has been pressed');
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => JoinRoom()));
              },
            ),
            RaisedButton(
              child: Text('Create Room'),
              onPressed: () {
                print('create room has been pressed');
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateRoom()));
              },
            )
          ],
        ),
      )
    );
  }
}
