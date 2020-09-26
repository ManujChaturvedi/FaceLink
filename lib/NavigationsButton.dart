import 'package:facial_social_media1/Location.dart';
import 'Location.dart';
import 'Notification.dart';
import 'AddPost.dart';
import 'package:flutter/material.dart';
import 'MyHomePage.dart';
import 'Profile.dart';

class NavigationButton extends StatefulWidget {
  @override
  _NavigationButtonState createState() => _NavigationButtonState();
}

class _NavigationButtonState extends State<NavigationButton> {
  int selectedIndex = 0;
  void  _onPageChanged(int index){
    setState(() {
      selectedIndex = index;
    });
  }
  void changeIndex(int index) {
    _pagecontroller.jumpToPage(index);

  }
  PageController _pagecontroller=PageController();
  List<Widget> _screens=[
    MyHomePage(),User_Location(),AddPost(),Notifications(),Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent[100],
      body: PageView(
        controller: _pagecontroller,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlueAccent[100],
//        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            title: Text("Find"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text("New"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            title: Text("Notification"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
          ),
        ],
        selectedItemColor: Colors.lightBlueAccent[700],
        unselectedItemColor: Colors.lightBlueAccent[100],
        currentIndex: selectedIndex,
        onTap: changeIndex,
      ),
    );
  }
}
