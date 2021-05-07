import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hla/models/user.dart';

class UserDatabaseService {
  //setting up variables
  final String name;
  final String uid;
  final String gameid;
  // initializing class definitions
  UserDatabaseService({this.name, this.uid, this.gameid});

  // refrences to specific database collections
  final CollectionReference userCollection = Firestore.instance.collection('Users');


  Future getUserData() async {
    final docRef = await userCollection.document(uid).get();
    print('Got doc: $docRef');
    return docRef;
  }

  Future updateUserData(String name, String gameid, int avatar) async {
    final docRef = await userCollection.document(uid).setData({
      'name' : name,
      'gameid': gameid,
      'avatar': avatar,
    });

  }

}




