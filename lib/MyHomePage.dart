import 'package:flutter/material.dart';
import 'post_container.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.lightBlueAccent[700],
        leading: Icon(
          Icons.camera_alt,
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          "FaceLink",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  print('working');
                },
              ),
            ],
          )
        ],
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(0.0),
          children: [
            PostContainer("images/images1.jpg"),
            PostContainer("images/images2.jpg"),
            PostContainer("images/images3.jpg"),
            PostContainer("images/images4.jpg"),
            PostContainer("images/images5.jpg"),
            PostContainer("images/images6.jpg"),
          ],
        ),
      ),
    );
  }
}
