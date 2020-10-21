
import 'package:flutter/material.dart';
import 'NavigationsButton.dart';
import 'signIn.dart';
import 'signUp.dart';

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
      routes: <String, WidgetBuilder>{
        'signup': (BuildContext context) =>  SignupPage(),
        'navigator':(BuildContext context) => NavigationButton()
      },
      title: 'Flutter Demo',
      home: SignIn(),
      //NavigationButton(),
    );
  }
}
