import 'package:first_flutter_app/alert_dialog.dart';
import 'package:first_flutter_app/call_api.dart';
import 'package:first_flutter_app/custom_widget.dart';
import 'package:first_flutter_app/image_view.dart';
import 'package:first_flutter_app/load_local_json.dart';
import 'package:first_flutter_app/map_integration.dart';
import 'package:first_flutter_app/my_edittext.dart';
import 'package:first_flutter_app/raisedbutton_state.dart';
import 'package:first_flutter_app/stepper_view.dart';
import 'package:flutter/material.dart';

/*
https://github.com/nisrulz/flutter-examples
  this is main function which contain runApp() function. you have to pass widget inside like i have passed MaterialApp
*/
void main() {
  /*
    MaterialApp is widget there you can see I have pass two elements "home: ClassName()" and "them : ThemeData()"
      home : Whichever StatelessWidget you pass will show on app when app start like splash screen
      theme : mainly contain data related theme like primaryColor and all.
  */
  runApp(MaterialApp(
    home: MyApp(),
    // Define the theme, set the primary swatch
    theme: ThemeData(primarySwatch: Colors.red),
  ));
}

/*
  As you can see i have extend MyApp class with StatelessWidget
  there are two type of widget Stateless and Stateful
  Stateless : in normal words its static screen
  Stateful : has data which can change and affect screen. Like switch, edittext, etc
*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*
    Container, Column, Row, Stack and Center are layouts
      Container − A rectangular box decorated using BoxDecoration widgets with background, border and shadow.
      Center − Center its child widget.
      Row − Arrange its children in the horizontal direction.
      Column − Arrange its children in the vertical direction.
      Stack − Arrange one above the another.
    */
    var column = Column(
      /*
        To makes the button stretch in horizontal axis use CrossAxisAlignment
      */
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        /*
        RaisedButton is normal button with common functionality
        child inside RaisedButton use to change appearance of button you can use image also
        color is for background color
        */
        RaisedButton(
          padding: const EdgeInsets.all(20.0),
          child: Text("RaisedButton",
              style: TextStyle(fontWeight: FontWeight.bold)),
          onPressed: () {
            /*
            To navigate to other screen use below lines
            */
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RaisedButtonState()));
          },
          color: Colors.white,
          textColor: Colors.black,
        ),
        RaisedButton(
          padding: const EdgeInsets.all(20.0),
          child:
              Text("Edittext", style: TextStyle(fontWeight: FontWeight.bold)),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyEditTextView()));
          },
          color: Colors.white,
          textColor: Colors.black,
        ),
        RaisedButton(
          padding: const EdgeInsets.all(20.0),
          child: Text("Image", style: TextStyle(fontWeight: FontWeight.bold)),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyImageView()));
          },
          color: Colors.white,
          textColor: Colors.black,
        ),
        RaisedButton(
          padding: const EdgeInsets.all(20.0),
          child: Text("Load local json file",
              style: TextStyle(fontWeight: FontWeight.bold)),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ListDataView()));
          },
          color: Colors.white,
          textColor: Colors.black,
        ),
        RaisedButton(
          padding: const EdgeInsets.all(20.0),
          child:
              Text("Call api", style: TextStyle(fontWeight: FontWeight.bold)),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoadDataFromApi()));
          },
          color: Colors.white,
          textColor: Colors.black,
        ),
        RaisedButton(
          padding: const EdgeInsets.all(20.0),
          child: Text("Alert dialog",
              style: TextStyle(fontWeight: FontWeight.bold)),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyAlertDialog()));
          },
          color: Colors.white,
          textColor: Colors.black,
        ),
        RaisedButton(
          padding: const EdgeInsets.all(20.0),
          child: Text("Stepper view",
              style: TextStyle(fontWeight: FontWeight.bold)),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyStepperView()));
          },
          color: Colors.white,
          textColor: Colors.black,
        ),
        RaisedButton(
          padding: const EdgeInsets.all(20.0),
          child: Text("Custom view",
              style: TextStyle(fontWeight: FontWeight.bold)),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CustomWidget()));
          },
          color: Colors.white,
          textColor: Colors.black,
        ),
        RaisedButton(
          padding: const EdgeInsets.all(20.0),
          child:
              Text("Google map", style: TextStyle(fontWeight: FontWeight.bold)),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MapIntegration()));
          },
          color: Colors.white,
          textColor: Colors.black,
        )
      ],
    );

    /*
    Scaffold is another widget which provide appBar, body,floating button, bottomAppBar, etc
    */
    return Scaffold(
      appBar: AppBar(
        title: Text("Few examples"),
      ),
      body: Container(
        // Sets the padding in the main container
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(child: column),

      ),
    );
    ;
  }
}
