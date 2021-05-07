import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hla/models/currentUser.dart';
import 'package:provider/provider.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {

    final users = Provider.of<List<CurrentUser>>(context);
    //print(users.documents);
    users.forEach((user) {
      print(user.name);
      print(user.avatar);
    });

    return Container(

    );
  }
}
