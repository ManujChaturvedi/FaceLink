import 'dart:convert';
import 'dart:io';
import 'package:facial_social_media1/post_container.dart';
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
          statusBarColor: Colors.blue,
          backgroundColor: Colors.white,
        ),
      );
      this.setState(() {
        _selectedFile = cropped;
      });
    }
  }

  List<FileModel> files;
  FileModel selectedModel;
  String image;
  Widget imageFileSelect(String image)
  {
    if(image==null )
      {
        return Container();
      }
    else {
      return Image.file(File(image),
        // height: MediaQuery.of(context).size.height * 0.30,
        // width: MediaQuery.of(context).size.width,
      );
  }
  }
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
    else
      {
        files=null;
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    files!=null
                   ? DropdownButtonHideUnderline(
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
                    )
                   :  Container(),
                  ],
                ),

                FlatButton(
                  onPressed: (){
                  //getImage(Image.file(File(image)),);
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(color: Colors.lightBlueAccent[700]),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.black,
            ),
            files!=null
            ?Expanded(
                 //height: MediaQuery.of(context).size.height * 0.30,
                child:  imageFileSelect(image),

                    )
            : Container(),
            Divider(),
            // Container(
            //   child: getImageWidget(),
            //),
            files!=null
            ?selectedModel == null  && selectedModel.files.length < 1
                ? Expanded(child: Container())
                : Expanded(
                  child: Container(
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
                ): Container(),

              SizedBox(
                height: 2,
              ),

            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                   CircleAvatar(
                     radius: 25,
                     backgroundColor: Colors.blue,
                     child: IconButton(
                       iconSize: 30,
                         icon: PostInteraction(
                           Icons.photo_camera,
                           Colors.white,
                         ),

                      onPressed: () {
                        getImage(ImageSource.camera);
                      },
                     ),
                   ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem> getItems() {

      return files.map(
              (e) => DropdownMenuItem(
            child: Text(
              e.folder,
              style: TextStyle(color: Colors.black),
            ),
            value: e,
          )).toList() ?? [];


  }
}
