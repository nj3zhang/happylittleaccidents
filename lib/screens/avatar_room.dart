import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:hla/screens/waiting_room.dart';
import 'package:hla/services/auth.dart';
import 'package:hla/services/userDatabase.dart';
import 'package:hla/models/user.dart';
import 'package:hla/models/background.dart';
import 'package:hla/models/avatarIcons.dart';

class AvatarRoom extends StatefulWidget {
  // how we pass variables from one screen to another
  //final String roomID;
  AvatarRoom();

  @override
  _AvatarRoomState createState() => _AvatarRoomState();
}

class _AvatarRoomState extends State<AvatarRoom> {
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
        body: Stack(children: <Widget>[
      BackgroundImg(),
      Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
            padding: const EdgeInsets.only(top: 110.0),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("lib/images/WindowLong.png"),
                      fit: BoxFit.cover)),
              height: 578,
              width: 331,
              child: Column(
                children: [
                  SelectYourAvatar(),
                  Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Text("Username:",
                          style:
                              TextStyle(fontSize: 20, fontFamily: 'Roboto'))),
                  Padding(
                      padding:
                          const EdgeInsets.only(top: 30.0, left: 65, right: 65),
                      child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "John Doe",
                          ),
                          onChanged: (String value) {
                            print('Value saved as "$value"');
                            setState(() => name = value);
                          })),
                ],
              ),
            )),
        EnterBtn()
      ])),
    ]));
  }
}

class EnterBtn extends StatelessWidget {
  EnterBtn();

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
            onPressed: () async {
              // create new user

              //if(_formKey.currentState.validate()){
              // signs in the user with a random id
              /*dynamic result = await _auth.signInAnon();
              User current_user = result;
              // now we need to set the values for the new user
              gameid = widget.roomID;
              _userdb.updateUserData(name, gameid, avatar);*/

              // navigate to waiting room
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => WaitingRoom()));
              //}
              // navigate to waiting room
            }),
        height: 63,
        width: 331,
      ),
    );
  }
}
