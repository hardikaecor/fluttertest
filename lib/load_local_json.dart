import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/widgets.dart';

class ListDataView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Load local json")),
        body: Container(
          child: LoadJson(),
        ));
  }
}

class LoadJson extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoadJsonState();
  }
}

class LoadJsonState extends State<LoadJson> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString("data/data.json"),
        builder: (context, result) {
          var jsonData = json.decode(result.data.toString());

          return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text.rich(
                          TextSpan(
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54),
                            text: "Movie name : ",
                            children: <TextSpan>[
                              TextSpan(
                                  text: jsonData[index]["Title"],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      ),
                      Container(
                        child: Text.rich(
                          TextSpan(
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54),
                            text: "Release year : ",
                            children: <TextSpan>[
                              TextSpan(
                                  text: jsonData[index]["Year"],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          textAlign: TextAlign.right,
                        ),
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      )
                    ],
                  ),
                );
              },
              itemCount: jsonData == null ? 0 : jsonData.length);
        },
      ),
    );
  }
}
