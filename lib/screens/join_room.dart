import 'package:flutter/material.dart';
import 'package:hla/screens/waiting_room.dart';
import 'package:hla/services/auth.dart';
import 'package:hla/services/roomDatabase.dart';
import 'package:hla/services/userDatabase.dart';
import 'package:hla/models/user.dart';

class JoinRoom extends StatefulWidget {
  @override
  _JoinRoomState createState() => _JoinRoomState();
}

class _JoinRoomState extends State<JoinRoom> {
  // variable declarations
  String name = '';
  int avatar = 1; // for now
  String uid = '';
  String gameid = ''; // will be entered by the user


  // this helps us create temp user instances in the database
  final UserAuth _auth = UserAuth();
  // creates refrence to user instance in the database (so we can manipulate it)
  final UserDatabaseService _userdb = UserDatabaseService();
  final RoomDatabaseService _roomdb = RoomDatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(top: 200.0),
              /// GRIDDDDDDD -> AVATARS
              /// Anda will fix this ~~~~ magic powers ~~~~~~~~~~
              child: Text('AVATARS')
          ),
          Container(
            /// User
            child: Form(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                    validator: (val) => val.isEmpty ? 'Enter your name' : null,
                    onChanged: (val) {
                      // represents the username
                      setState(() => name = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    validator: (val) => val.isEmpty ? 'Enter your name' : null,
                    onChanged: (val) {
                      // represents the username
                      setState(() => gameid = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    color: Colors.deepOrangeAccent,
                    child: Text('Start Game', style: TextStyle(color: Colors.white)),
                    onPressed: () async {
                      // signs in the user with a random id
                      dynamic result = await _auth.signInAnon();
                      // now we need to set the values for the new user
                      _userdb.updateUserData(name, gameid, avatar);
                      String userid = _userdb.getUserData().toString();
                      _roomdb.addUser(userid);
                      // navigate to waiting room
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => WaitingRoom()));
                      //}
                      // navigate to waiting room
                    },
                  )

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
