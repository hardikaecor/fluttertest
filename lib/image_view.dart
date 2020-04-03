import 'package:flutter/material.dart';

/*
In this example I have set image as background of screen and put ImageView in center with shadow effect 
*/

class MyImageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image")),
      body: Container(
          child: Center(
              child: Container(
            /*
                If you want to use local image then you have make any name folder and insert all images. Then you need to mention all image
                inside pubspec.yaml like this
                  flutter:
                    asset:
                      - folderName/imageName.png
                      - folderName/imageName.png
                 make sure about this
                 <1 tab space>asset:
                 <2 tab space>- folderName/imageName.png
                 <2 tab space>- folderName/imageName.png
                 
                 and space between - and image name
                */
            child: Image.asset("images/food.jpg"),
            margin: EdgeInsets.all(15.0),
            /*
              to decorate body use BoxDecoration
              I have set BoxShadow inside BoxDecoration
            */
            decoration: BoxDecoration(boxShadow: [
              /*
                mainly you will understand all parameter by its name. offset used to position shadow if you set 0,0 its center to view
                first 0 is for horizontal shadow if you increase first value then shadow will move to right side (i.e 5,0)
                second 0 is for vertical shadow if you increase second value then shadow will move to bottom side (i.e 0,5)
              */
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 3.0,
                  spreadRadius: 7.0,
                  offset: Offset(0, 0))
            ]),
          )),
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/food2.jpg"), fit: BoxFit.cover))),
    );
  }
}
