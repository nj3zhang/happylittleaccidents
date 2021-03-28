import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hla/screens/create_room.dart';
import 'package:hla/screens/join_room.dart';
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
<<<<<<< HEAD
    return Scaffold(
      body: Stack(
=======
<<<<<<< HEAD
    return Scaffold(
      body: Container(

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
              onPressed: () async {
                // create instance of a new room
                final RoomDatabaseService _roomdb = RoomDatabaseService();
                // we need to keep track of the document id
                // we wait until the db entry is done and ask for the id to confirm
                String gameID = await _roomdb.getRoomID();
                print('New room created. ID: $gameID');

                print('create room has been pressed');
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateRoom(gameID)));
              },
            )
          ],
        ),
      )
=======
    return Container(
      // Background
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("lib/images/background.jpg"), fit: BoxFit.cover),
      ),

      child: Column(
>>>>>>> 651cd0874c74e322bd89d4ceec4b33997f2debf2
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/images/background.jpg"),
                  fit: BoxFit.cover),
            ),
          ),

<<<<<<< HEAD
          // Welcome photo
          Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 110.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("lib/images/WelcomeWindowPlus.png"),
                            fit: BoxFit.cover),
                      ),
                      height: 437,
                      width: 331,
                    )),

                // Join Room
                Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: Container(
                    child: FloatingActionButton.extended(
                        backgroundColor: Color.fromARGB(255, 233, 118, 97),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(38)),
                        label: Text("JOIN ROOM",
                            style:
                                TextStyle(fontSize: 20, fontFamily: 'Roboto')),
                        elevation: 10.0,
                        onPressed: () {
                          print('join room has been pressed');
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => JoinRoom()));
                        }),
                    height: 63,
                    width: 331,
                  ),
                ),

                // Create Room
                Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: Container(
                    child: FloatingActionButton.extended(
                        backgroundColor: Color.fromARGB(255, 233, 118, 97),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(38)),
                        label: Text("CREATE ROOM",
                            style:
                                TextStyle(fontSize: 20, fontFamily: 'Roboto')),
                        elevation: 10.0,
                        onPressed: () {
                          print('create room has been pressed');
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CreateRoom()));
                        }),
                    height: 63,
                    width: 331,
                  ),
                )
              ]))
=======
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
            onPressed: () {
              print('create room has been pressed');
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CreateRoom()));
            },
          )
>>>>>>> 651cd0874c74e322bd89d4ceec4b33997f2debf2
        ],
      ),
>>>>>>> dbeceb0ed167af4a1bb5269087c72388524ddc8c
    );
  }
}
