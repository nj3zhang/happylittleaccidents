import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Avatar {
  Color colour;
  String icon;
  bool isSelected;

  Avatar(this.colour, this.icon, this.isSelected);
}

class CustomRadio extends StatelessWidget {
  Avatar _avatar;

  CustomRadio(this._avatar);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        color: _avatar.isSelected ? Color(0xE97661) : _avatar.colour,
        child: Container(
            height: 40,
            width: 40,
            alignment: Alignment.center,
            // margin: new EdgeInsets.all(5.0),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ImageIcon(AssetImage(_avatar.icon)),
              ],
            ))));
  }
}

class AvatarSelector extends StatefulWidget {
  @override
  _AvatarSelectorState createState() => _AvatarSelectorState();
}

class _AvatarSelectorState extends State<AvatarSelector> {
  List<Avatar> avatars = new List<Avatar>();
  List<Avatar> avatar1 = new List<Avatar>();
  List<Avatar> avatar2 = new List<Avatar>();
  List<Avatar> avatar3 = new List<Avatar>();

  @override
  void initState() {
    super.initState();
    avatars.add(new Avatar(
        Color.fromARGB(255, 251, 225, 208), "lib/images/icon1.png", false));
    avatars.add(new Avatar(
        Color.fromARGB(255, 197, 220, 250), "lib/images/icon2.png", false));
    avatars.add(new Avatar(
        Color.fromARGB(255, 208, 188, 175), "lib/images/icon3.png", false));
    avatars.add(new Avatar(
        Color.fromARGB(255, 246, 157, 141), "lib/images/icon4.png", false));
    avatars.add(new Avatar(
        Color.fromARGB(255, 249, 233, 168), "lib/images/icon5.png", false));
    avatars.add(new Avatar(
        Color.fromARGB(255, 250, 194, 184), "lib/images/icon6.png", false));

    avatar1.add(avatars[0]);
    avatar1.add(avatars[1]);
    avatar1.add(avatars[2]);
    avatar2.add(avatars[3]);
    avatar2.add(avatars[4]);
    avatar2.add(avatars[5]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 50.0,
            width: 260,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return InkWell(
                      highlightColor: Colors.pinkAccent,
                      onTap: () {
                        setState(() {
                          avatars
                              .forEach((avatar) => avatar.isSelected = false);
                          avatars[index].isSelected = true;
                        });
                      },
                      child: Row(children: [
                        Padding(
                            padding: const EdgeInsets.only(
                                right: 24, top: 24, bottom: 24)),
                        CustomRadio(avatar1[index])
                      ]));
                })),
        SizedBox(
            height: 50.0,
            width: 260,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return InkWell(
                      focusColor: Colors.pinkAccent,
                      onTap: () {
                        setState(() {
                          avatars
                              .forEach((avatar) => avatar.isSelected = false);
                          avatar2[index].isSelected = true;
                        });
                      },
                      child: Row(children: [
                        Padding(
                            padding: const EdgeInsets.only(
                                right: 24, top: 24, bottom: 24)),
                        CustomRadio(avatar2[index])
                      ]));
                })),
      ],
    );
  }
}
