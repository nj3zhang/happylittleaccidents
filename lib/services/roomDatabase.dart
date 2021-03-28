import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hla/models/user.dart';
import 'dart:math';

class RoomDatabaseService {
  //setting up variables
  final String gameid;
  // initializing class definitions
  RoomDatabaseService({this.gameid});

  // refrences to specific database collections
  final CollectionReference roomCollection = Firestore.instance.collection('Rooms');

  Future getRoomData() async {
    final docRef = await roomCollection.document(gameid).get();
    print('Got room id: $docRef');
    return docRef;
  }

  getRoomID() async{
    final gameid = await newRoom();
    print('GET ROOM ID: $gameid');
    return gameid;
  }

  static const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  // creates new game room
  Future newRoom() async{
    String room_key = getRandomString(5);
    print('generated key is $room_key');

    final docRef = await roomCollection.document(room_key).setData({'players' : 1,});
    return docRef;
  }

}