import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(MaterialApp(
    title: 'Gallery',
    home: myapp(),
  ));
}

class myapp extends StatefulWidget {
  @override
  myappstate createState() => myappstate();
}

class myappstate extends State<myapp> {
  File imagefile;
  var dir;
  Future opengallery() async{
    var img = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imagefile = File('${img.path}');
      dir = img.parent;
      print(imagefile.toString());
    });
  }
  myappstate(){
    opengallery();
  }
  Widget showimage(BuildContext context){
    if(imagefile == null){
      return Text('pick an image');
    }else{
      return Image.file(
        imagefile,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: InkWell(
          onTap: (){
            opengallery();
          },
          child: showimage(context),
        )
      ),
    );
  }
}
