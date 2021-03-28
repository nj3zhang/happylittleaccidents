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
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/images/background.jpg"),
                  fit: BoxFit.cover),
            ),
          ),

          ElevatedButton(
            child: Text('Join Room'),
            onPressed: () {
              print('join room has been pressed');
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => JoinRoom()));
            },
          ),
          ElevatedButton(
            child: Text('Create Room'),
            onPressed: () async {
              // create instance of a new room
              final RoomDatabaseService _roomdb = RoomDatabaseService();
              // we need to keep track of the document id
              // we wait until the db entry is done and ask for the id to confirm
              String gameID = await _roomdb.getRoomID();
              print('New room created. ID: $gameID');

              print('create room has been pressed');
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CreateRoom(gameID)));
            },
          )
        ],
      ),
    );
  }
}
