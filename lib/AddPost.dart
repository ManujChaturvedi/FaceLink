import 'dart:convert';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:storage_path/storage_path.dart';
import 'package:facial_social_media1/file.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  File _selectedFile;
  Widget getImageWidget() {
      return Image.file(_selectedFile, fit: BoxFit.cover);
  }

  getImage(ImageSource source) async {
    File image = await ImagePicker.pickImage(source: source);

  }

  List<FileModel> files;
  FileModel selectedModel;
  String image;
  @override
  void initState() {
    super.initState();
    getImagePath();
  }

  getImagePath() async {
    var imagePath = await StoragePath.imagesPath;
    var images = jsonDecode(imagePath) as List;
    files = images.map<FileModel>((e) => FileModel.fromJson(e)).toList();
    if (files != null && files.length > 0) {
      setState(() {
        selectedModel = files[0];
        image = files[0].files[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent[100],
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.clear),
                    SizedBox(
                      width: 10,
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton<FileModel>(
                        items: getItems(),
                        onChanged: (FileModel d) {
                          assert(d.files.length > 0);
                          image = d.files[0];
                          setState(() {
                            selectedModel = d;
                          });
                        },
                        value: selectedModel,
                      ),
                    ),
                  ],
                ),
                FlatButton(
                  onPressed: (){
                  // getImage(Image.file(File(image)),);
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(color: Colors.lightBlueAccent[700]),
                  ),
                ),
              ],
            ),
            Divider(),
            Container(
                height: MediaQuery.of(context).size.height * 0.30,
                child:  Image.file(File(image),
                        height: MediaQuery.of(context).size.height * 0.30,
                        width: MediaQuery.of(context).size.width,
                      )
                    ),
            Divider(),
            // Container(
            //   child: getImageWidget(),
            //),

            selectedModel == null && selectedModel.files.length < 1
                ? Container()
                : Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 4),
                        itemBuilder: (_,i) {
                          var file=selectedModel.files[i];
                          return GestureDetector(
                            child: Image.file(
                              File(file),
                              fit: BoxFit.cover,
                            ),
                            onTap: () {
                              setState(() {
                                image = file;
                              });
                            },
                          );
                        },
                   itemCount: selectedModel.files.length,),
                  ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                   RaisedButton(
                    color: Colors.lightBlueAccent[700],
                    child: Text(
                      'camera',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      getImage(ImageSource.camera);
                    },
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem> getItems() {
    return files.map((e) => DropdownMenuItem(
                  child: Text(
                    e.folder,
                    style: TextStyle(color: Colors.black),
                  ),
                  value: e,
                )).toList() ?? [];

  }
}
