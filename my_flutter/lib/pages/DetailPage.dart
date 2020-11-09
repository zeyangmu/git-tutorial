import 'package:flutter/material.dart';
import 'package:my_flutter/Models/SearchResult.dart';
import 'package:my_flutter/request/baseRequest.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    fetchDetail();
  }

  void fetchDetail() {
    HttpRequest.requestForCustorm("").then((res) {});
  }

  @override
  Widget build(BuildContext context) {
    ResultList resultList = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("${resultList.name}"),
      ),
      body: Center(
        child: Column(children: [
          Card(
            child: Image.network(resultList.pic),
          )
        ]),
      ),
    );
  }
}
