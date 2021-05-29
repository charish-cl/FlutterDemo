import 'package:flutter/material.dart';
import 'dart:convert';
class TestPage extends StatefulWidget {
  TestPage({Key key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  String json2='[{"name":"Jack"},{"name":"Rose"}]';
  @override
  void initState() { 
   Map<String, dynamic> user = json.decode("https://v0.yiketianqi.com/api?version=v9&appid=71963977&appsecret=mpFydu4y");
    print('Howdy, ${user['city']}!');
    print('We sent the verification link to ${user['country']}.');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(),
        body: Text("dwad"),
      );
    
  }
}
