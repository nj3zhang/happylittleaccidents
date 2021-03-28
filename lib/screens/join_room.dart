import 'package:flutter/material.dart';
import 'package:hla/models/background.dart';

class JoinRoom extends StatefulWidget {
  @override
  _JoinRoomState createState() => _JoinRoomState();
}

class _JoinRoomState extends State<JoinRoom> {
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
                        }))
              ],
            ),
          ),
        ),
        Padding(child: EnterBtn(), padding: const EdgeInsets.only(top: 35.0))
      ]))
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
            label: Text("ENTER",
                style: TextStyle(fontSize: 20, fontFamily: 'Roboto')),
            elevation: 10.0,
            onPressed: () async {}),
        height: 63,
        width: 331,
      ),
    );
  }
}
