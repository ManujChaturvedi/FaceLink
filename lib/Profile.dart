import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'post_container.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int selectedIndex = 0;
  // ignore: non_constant_identifier_names
  Color PostColor=Colors.white;
  Color tagsColor=Colors.white;
  Color videoColor=Colors.white;
  Expanded profile_button(String buttonName,Color textColor) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          print('me');
          setState(() {
            if(buttonName=='Posts')
              {
                PostColor=Colors.black;
                tagsColor=Colors.white;
                videoColor=Colors.white;
              }
            else if(buttonName=='Videos')
              {
                PostColor=Colors.white;
                tagsColor=Colors.white;
                videoColor=Colors.black;
              }
            else if(buttonName=='Tags')
            {
              PostColor=Colors.white;
              tagsColor=Colors.black;
              videoColor=Colors.white;
            }
          });

        },
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                buttonName,
                style: TextStyle(color: textColor),
              ),
            ),
            Icon(
              Icons.arrow_drop_down_circle,
              color: Colors.white,
              size: 5,
            ),
            Divider(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  bool state = false;
  void changeState() {
    setState(() {
      if (state) {
        state = false;
      } else {
        state = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        // padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: ListView(
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              IconButton(
                icon: PostInteraction(
                  Icons.format_list_bulleted,
                  Colors.white,
                ),
                onPressed: () {},
              ),
            ]),
            Row(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: RawMaterialButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.account_circle,
                        size: 80,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(3.0),
                      shape: CircleBorder(),
                    ),
                    // child: SvgPicture.asset(
                    //   'icons/avtar.svg',
                    //   width: 80,
                    //   height: 80,
                    // ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'User_Name',
                style: TextStyle(
                  //fontFamily: 'Pacifico',
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FriendButton(

                    state
                        ? Text(
                            "Following",
                            style: TextStyle(color: Colors.white),
                          )
                        : Text("  Follow   "),
                    state
                        ? Icon(Icons.check, color: Colors.white)
                        : Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                      state ? Colors.blue : Colors.white,
                    changeState),
                SizedBox(
                  width: 20,
                ),
                RaisedButton(
                  // margin: EdgeInsets.symmetric(
                  //     vertical: 20.0, horizontal: 10.0),
                  onPressed: () {},
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 13, horizontal: 30),
                    child: Text('Message'),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.white,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: <Widget>[
                profile_button('Posts',PostColor),
                profile_button('Videos',videoColor),
                profile_button('Tags',tagsColor),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            ListBody(
              children: [
                PostContainer("images/images1.jpg"),
                PostContainer("images/images2.jpg"),
                PostContainer("images/images3.jpg"),
                PostContainer("images/images4.jpg"),
                PostContainer("images/images5.jpg"),
                PostContainer("images/images6.jpg"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FriendButton extends StatelessWidget {
  final Function onPressed;
  final Text friendStatus;
  final Icon friendStatusIcon;
  final Color friendStatusColor;

  FriendButton(this.friendStatus, this.friendStatusIcon, this.friendStatusColor,
      this.onPressed);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      color: friendStatusColor,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          friendStatusIcon,
          SizedBox(width: 5),
          friendStatus,
        ],
      ),
    );
  }
}
