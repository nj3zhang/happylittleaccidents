import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hla/models/user.dart';

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

  // creates new game room
  Future newRoom() async{
    final docRef = await roomCollection.add({'players' : 1,});
    //print(docRef.documentID);
  }

}