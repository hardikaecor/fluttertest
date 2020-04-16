import 'package:flutter/material.dart';

class RaisedButtonState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Declare some constants
    final double myTextSize = 35.0;
    final double myIconSize = 60.0;
    final TextStyle myTextStyle =
    TextStyle(color: Colors.black54, fontSize: myTextSize);

    var column = Column(
      // Makes the cards stretch in horizontal axis
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // Setup the card
        MyCard(
          // Setup the text
            title: Text(
              "Favorite",
              style: myTextStyle,
            ),
            // Setup the icon
            size: myIconSize,
            color: Colors.red,
            icon: Icons.favorite),
        MyCard(
            title: Text(
              "Alarm",
              style: myTextStyle,
            ),
            icon: Icons.alarm, size: myIconSize, color: Colors.blue),
        MyCard(
            title: Text(
              "Airport Shuttle",
              style: myTextStyle,
            ),
            icon: Icons.airport_shuttle,
            size: myIconSize, color: Colors.amber),
        MyCard(
            title: Text(
              "Done",
              style: myTextStyle,
            ),
            icon: Icons.done, size: myIconSize, color: Colors.green)
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Stateless Widget"),
      ),
      body: Container(
        // Sets the padding in the main container
        padding: const EdgeInsets.only(bottom: 6.0),
        child: Center(
          child: SingleChildScrollView(child: column),
        ),
      ),
    );
    ;
  }
}

// Create a reusable stateless widget
class MyCard extends StatelessWidget {
  final Widget title;
  final double size;
  final Color color;
  final IconData icon;

  // Constructor. {} here denote that they are optional values i.e you can use as: MyCard()
  MyCard({this.title, this.size, this.color, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 1.0),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              this.title,
              MyIcon(size: this.size, color: this.color, icon: this.icon)
            ],
          ),
        ),
      ),
    );
  }
}

class MyIcon extends StatefulWidget {
  final double size;
  final Color color;
  final IconData icon;
  final bool isClick = false;

  // Constructor. {} here denote that they are optional values i.e you can use as: MyCard()
  MyIcon({this.size, this.color, this.icon});

  @override
  State<StatefulWidget> createState() {
    return MyIconState(size: this.size, color: this.color, icon: this.icon);
  }
}

class MyIconState extends State<MyIcon> {
  final double size;
  final Color color;
  Color defaultColor = Colors.grey;
  final IconData icon;
  bool isClick = false;

  // Constructor. {} here denote that they are optional values i.e you can use as: MyCard()
  MyIconState({this.size, this.color, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Icon(this.icon, size: this.size, color: defaultColor),
        color: Colors.white,
        onPressed: onPressOnIcon,
      ),
    );
  }

  void onPressOnIcon() {
    setState(() {
      if (this.isClick) {
        this.isClick = false;
        defaultColor = Colors.grey;
      } else {
        this.isClick = true;
        defaultColor = this.color;
      }
    });
  }
}