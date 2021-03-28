import 'dart:html';
import 'package:hla/models/currentUser.dart';
import 'package:hla/services/roomDatabase.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:hla/services/currentUserList.dart';

class WaitingRoom extends StatefulWidget {
  @override
  _WaitingRoomState createState() => _WaitingRoomState();
}

class _WaitingRoomState extends State<WaitingRoom> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider <List<CurrentUser>>.value(
      value: RoomDatabaseService().users,
      child: Scaffold(
        body: Container(
          child: Text('Waiting for everyone to join'),
        ),
      )
    );
  }
}
