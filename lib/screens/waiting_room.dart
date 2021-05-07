//import 'dart:html';
import 'package:hla/models/currentUser.dart';
import 'package:hla/services/roomDatabase.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:hla/services/currentUserList.dart';
import 'package:flutter/services.dart';
import 'package:hla/models/background.dart';
import 'package:hla/screens/game_page.dart';
import 'package:hla/models/avatarIcons.dart';

class WaitingRoom extends StatefulWidget {
  @override
  _WaitingRoomState createState() => _WaitingRoomState();
}

class _WaitingRoomState extends State<WaitingRoom> {
  @override
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      BackgroundImg(),
      Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("lib/images/HorizontalWindow.png"),
                        fit: BoxFit.cover)),
             //   height: 818,
              //  width: 322,
                child: Row(children: [
                  ActiveAvatars(),
                  Column(children: [RoomKeySection(), StartBtn()])
                ])))
      ]))
    ]));
  }
}

class ActiveAvatars extends StatelessWidget {
  ActiveAvatars();
  List<Avatar> avatars = new List<Avatar>();

  @override
  void initState() {
    avatars.add(new Avatar(
        Color.fromARGB(255, 251, 225, 208), "lib/images/icon1.png", false));
    avatars.add(new Avatar(
        Color.fromARGB(255, 197, 220, 250), "lib/images/icon2.png", false));
    avatars.add(new Avatar(
        Color.fromARGB(255, 208, 188, 175), "lib/images/icon3.png", false));
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider <List<CurrentUser>>.value(
      value: RoomDatabaseService().users,
      child: Scaffold(
        body: Container(
          child: Text('Waiting for everyone to join'),
        ),
      ));
    /*return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Container(
          
          // height: 260,
          // width: 200,
          ),
    );*/
  }
}

class RoomKeySection extends StatelessWidget {
  RoomKeySection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35.0),
      child: Container(
          child: Row(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Text("Room Key: ABC38F",
                  style: TextStyle(fontSize: 20, fontFamily: 'Roboto'))),
          FloatingActionButton.extended(
              backgroundColor: Color.fromRGBO(255, 255, 255, 255),
              icon: ImageIcon(AssetImage("lib/images/ShareBtn.png")),
              elevation: 10.0,
              onPressed: () {
                print('share has been pressed');
              }),
        ],
      )),
    );
  }
}

class StartBtn extends StatelessWidget {
  StartBtn();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Container(
        child: FloatingActionButton.extended(
            backgroundColor: Color.fromARGB(255, 233, 118, 97),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(38)),
            label: Text("CREATE ROOM",
                style: TextStyle(fontSize: 20, fontFamily: 'Roboto')),
            elevation: 10.0,
            onPressed: () async {
              // navigate to waiting room
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => GamePage()));
              //}
              // navigate to waiting room
            }),
        //height: 63,
        //width: 331,
      ),
    );
  }
}

