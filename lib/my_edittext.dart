import 'package:flutter/material.dart';

class MyEditTextView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Edittext")),
        body: Container(
          child: MyEditText(),
        ));
  }
}

class MyEditText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyEditTextState();
  }
}

class MyEditTextState extends State<MyEditText> {
  String data = "";
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TextField(
        decoration: InputDecoration(hintText: "Type anything"),
        onSubmitted: (String txt) {
          setState(() {
            data = data + "\n" + txt;
            controller.text = "";
          });
        },
        controller: controller,
      ),
      Text(data)
    ]);
  }
}
