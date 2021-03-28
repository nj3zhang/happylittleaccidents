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
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/images/background.jpg"),
                  fit: BoxFit.cover),
            ),
          ),

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
        ],
      ),
    );
  }
}
