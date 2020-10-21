import 'dart:io';

import 'package:flutter/material.dart';
import 'post_container.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // camera croper add by utsav
  getImage(ImageSource source) async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(source: source);
    if (image != null) {
      File cropped = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressFormat: ImageCompressFormat.jpg,
        androidUiSettings: AndroidUiSettings(
          toolbarColor: Colors.blue,
          toolbarTitle: "Crop Image",
          statusBarColor: Colors.lightBlueAccent[700],
          backgroundColor: Colors.white,
        ),
      );
      this.setState(() {
        //_selectedFile = cropped;
      });
    }
  }
  // end camera 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue,
        leading: IconButton(
        icon: PostInteraction(
           Icons.photo_camera,
           Colors.white,
        ),
          onPressed: ()
          {
            // call camera 
           getImage(ImageSource.camera);
          },
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
