import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoadDataFromApi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Load data from api"),
      ),
      body: Container(
        child: LoadData(),
      ),
    );
  }
}

class LoadData extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoadDataState();
  }
}

class LoadDataState extends State<LoadData> {
  final String url =
      "https://gist.githubusercontent.com/rbreve/60eb5f6fe49d5f019d0c39d71cb8388d/raw/f6bc27e3e637257e2f75c278520709dd20b1e089/movies.json";
  List data;

  Future<String> getData() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    print(response.body);

    setState(() {
      data = json.decode(response.body);
    });

    return "Sucessfull";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        physics: new NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 4,
            margin: EdgeInsets.all(8),
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text.rich(TextSpan(
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black54),
                        text: "Movie name : ",
                        children: <TextSpan>[
                          TextSpan(
                              text: data[index]["title"],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))
                        ])),
                    padding: EdgeInsets.fromLTRB(10, 100, 10, 0),
                  ),
                  Container(
                    child: Text.rich(TextSpan(
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black54),
                        text: "Year : ",
                        children: <TextSpan>[
                          TextSpan(
                              text: data[index]["year"],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))
                        ])),
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 100),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: data == null ? 0 : data.length,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }
}
