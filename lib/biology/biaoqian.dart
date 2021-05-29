import 'package:flutter/material.dart';
import 'package:flutter_tag_layout/flutter_tag_layout.dart';
class TextWarpTagPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<TextWarpTagPage> {
  
  ///文本标签集合
  List<String> tagList = [
    "凶狠", "测试", "这是什么", "早上好","吃饭", "再来一次"
    "凶狠", "测试", "这是什么", "早上好","吃饭", "再来一次"
    "凶狠", "测试", "这是什么", "早上好","吃饭", "再来一次"
    "凶狠", "测试", "这是什么", "早上好","吃饭", "再来一次"
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> itemWidgetList = [];

    for (var i = 0; i < tagList.length; i++) {
      var str = tagList[i];
      itemWidgetList.add(TextTagWidget("$str"));
    }
    return Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 30.0, left: 10, right: 10),

          ///流式布局
          child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,

              ///子标签
              children: itemWidgetList),
        ));
  }
}

