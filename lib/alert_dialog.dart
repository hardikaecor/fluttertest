import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert dialog"),
      ),
      body: AlertDialogView(),
    );
  }
}

class AlertDialogView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AlertDialogState();
  }
}

class AlertDialogState extends State<AlertDialogView> {
  AlertDialog alertDialog = AlertDialog(
    title: Text("First Dialog"),
    content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[Image.asset("images/food2.jpg"), Text("Noodles")],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: RaisedButton(
        child: Text("Please click here!!"),
        onPressed: () {
          showDialog(
              context: context, builder: (BuildContext context) => alertDialog);
        },
      ),
    ));
  }
}
