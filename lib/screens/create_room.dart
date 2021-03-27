import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:hla/screens/waiting_room.dart';
import 'package:hla/services/auth.dart';
import 'package:hla/services/userDatabase.dart';
import 'package:hla/models/user.dart';

class CreateRoom extends StatefulWidget {

  // how we pass variables from one screen to another
  final String roomID;
  CreateRoom(this.roomID);

  @override
  _CreateRoomState createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {

  // this helps us create temp user instances in the database
  final UserAuth _auth = UserAuth();
  // creates refrence to user instance in the database (so we can manipulate it)
  final UserDatabaseService _userdb = UserDatabaseService();


  // for validation purposes
  final _formKey = GlobalKey<FormState>();

  // variable definitions
  String name = '';
  int avatar = 1; // for now
  String uid = '';
  String gameid = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
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
                  RaisedButton(
                    color: Colors.deepOrangeAccent,
                    child: Text('Start Game', style: TextStyle(color: Colors.white)),
                    onPressed: () async {
                      // create new user
                      if(_formKey.currentState.validate()){
                        // signs in the user with a random id
                        dynamic result = await _auth.signInAnon();
                        User current_user = result;
                        // now we need to set the values for the new user
                        gameid = widget.roomID;
                        _userdb.updateUserData(name, gameid, avatar);

                        // navigate to waiting room
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => WaitingRoom()));
                      }
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
