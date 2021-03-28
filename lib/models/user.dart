// this is to represent the instance of a user
class User{
  final String uid;
  final String roomid;
  int avatar;

  User({this.uid, this.roomid});

  String getUID(){
    return uid;
  }

  String getRoomID(){
    return roomid;
  }

  int getAvatar(){
    return avatar;
  }

  void setAvatar(int val){
    avatar = val;
    print ('new avatar set');
  }

}