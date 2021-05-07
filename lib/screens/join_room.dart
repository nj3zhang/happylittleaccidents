import 'package:flutter/material.dart';
import 'package:hla/screens/waiting_room.dart';
import 'package:hla/services/auth.dart';
import 'package:hla/services/roomDatabase.dart';
import 'package:hla/services/userDatabase.dart';
import 'package:hla/models/background.dart';
import 'package:hla/screens/avatar_room.dart';

import 'game_page.dart';


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
        body: Stack(children: <Widget>[
      BackgroundImg(),
      Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
                  Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 110.0),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("lib/images/EnterRoomKey.png"),
                    fit: BoxFit.cover)),
            height: 311,
            width: 349,
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 120.0),
                    child: Text("Enter room key",
                        style: TextStyle(fontSize: 20, fontFamily: 'Roboto'))),
                Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, left: 85, right: 85),
                    child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'ROOMKEY',
                        ),
                        onSubmitted: (String value) {
                          print('Value saved as "$value"');
                          gameid = value;
                        }))
              ],
            ),
          ),
        ),
        Padding(child: EnterBtn(gameid), padding: const EdgeInsets.only(top: 35.0))
      ]))
    ]));
  }
}

class EnterBtn extends StatelessWidget {
  final String roomID;
  EnterBtn(this.roomID);

  // this helps us create temp user instances in the database
  final UserAuth _auth = UserAuth();
  // creates refrence to user instance in the database (so we can manipulate it)
  final UserDatabaseService _userdb = UserDatabaseService();
  final RoomDatabaseService _roomdb = RoomDatabaseService();


  // for validation purposes
  final _formKey = GlobalKey<FormState>();

  // variable definitions
  String name = '';
  int avatar = 1; // for now
  String uid = '';
  String gameid = '';


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35.0),
      child: Container(
        child: FloatingActionButton.extended(
            backgroundColor: Color.fromARGB(255, 233, 118, 97),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(38)),
            label: Text("ENTER",
                style: TextStyle(fontSize: 20, fontFamily: 'Roboto')),
            elevation: 10.0,
            onPressed: () async {
                  dynamic result = await _auth.signInAnon();
                  // now we need to set the values for the new user
                  _userdb.updateUserData(name, gameid, avatar);
                  String userid = _userdb.getUserData().toString();
                  _roomdb.addUser(userid);

                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => GamePage()));
            }),
        height: 63,
        width: 331,

      ),
    );
  }
}
