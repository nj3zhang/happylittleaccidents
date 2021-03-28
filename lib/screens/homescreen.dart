import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hla/screens/create_room.dart';
import 'package:hla/screens/join_room.dart';
import 'package:hla/services/roomDatabase.dart';
import 'package:hla/screens/game_page.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
          // Background
          decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("lib/images/background.jpg"), fit: BoxFit.cover),
      )),
      Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            WelcomeWindowPlus(),
            JoinRoom(),
            CreateRoom()
          ]))
    ]));
  }
}

class WelcomeWindowPlus extends StatelessWidget {
  WelcomeWindowPlus();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 110.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/images/WelcomeWindowPlus.png"),
                fit: BoxFit.cover),
          ),
          height: 437,
          width: 331,
        ));
  }
}

class JoinRoom extends StatelessWidget {
  JoinRoom();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35.0),
      child: Container(
        child: FloatingActionButton.extended(
            backgroundColor: Color.fromARGB(255, 233, 118, 97),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(38)),
            label: Text("JOIN ROOM",
                style: TextStyle(fontSize: 20, fontFamily: 'Roboto')),
            elevation: 10.0,
            onPressed: () {
              print('join room has been pressed');
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => JoinRoom()));
            }),
        height: 63,
        width: 331,
      ),
    );
  }
}

class CreateRoom extends StatelessWidget {
  CreateRoom();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35.0),
      child: Container(
        child: FloatingActionButton.extended(
            backgroundColor: Color.fromARGB(255, 233, 118, 97),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(38)),
            label: Text("CREATE ROOM",
                style: TextStyle(fontSize: 20, fontFamily: 'Roboto')),
            elevation: 10.0,
            onPressed: () async {
              // create instance of a new room
              final RoomDatabaseService _roomdb = RoomDatabaseService();
              // we need to keep track of the document id
              // we wait until the db entry is done and ask for the id to confirm
              String gameID = await _roomdb.getRoomID();
              print('New room created. ID: $gameID');

              print('create room has been pressed');
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateRoom(gameID)));
            }),
        height: 63,
        width: 331,
      ),
    );
  }
}
