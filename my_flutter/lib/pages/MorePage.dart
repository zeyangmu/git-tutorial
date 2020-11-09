import 'package:flutter/material.dart';

class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('更多'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 80),
        child: Column(
          children: [
            ListTile(title: Text("我的订单"), leading: Icon(Icons.apartment)),
            ListTile(title: Text("我的订单"), leading: Icon(Icons.app_blocking)),
            ListTile(title: Text("设置"), leading: Icon(Icons.settings)),
          ],
        ),
      ),
    );
  }
}
