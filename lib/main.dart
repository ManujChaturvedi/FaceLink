
import 'package:flutter/material.dart';

import 'NavigationsButton.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primaryColor: Color(0xff80d8ff),
      //   primarySwatch: Colors.blue,
      // ),
      home: NavigationButton(),
    //   initialRoute:'Profile',
    //     routes:{
    //       'myHomePage':(context)=>MyHomePage(),
    //       'Profile':(context)=>Profile(),
    // },
    );
  }
}
