import 'package:flutter/material.dart';

class FavorPage extends StatefulWidget {
  @override
  _FavorPageState createState() => _FavorPageState();
}

class _FavorPageState extends State<FavorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('喜欢'),
      ),
      body: Container(
        child: Center(
          child: Text('嘻哈'),
        ),
      ),
    );
  }
}
