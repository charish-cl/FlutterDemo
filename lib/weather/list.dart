import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'home.dart';
///未来7天天气列表
class ListPage extends StatelessWidget {
  ListPage({Key key, this.locationCity = '西安市'}) : super(key: key);

  //城市
  final String locationCity;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "List Page",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text("未来一周天气"),
          centerTitle: true,
        ),
        body: WeatherListBody(
          locationCity: locationCity,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

///天气预报列表
class WeatherListBody extends StatefulWidget {
  //城市

  WeatherListBody({Key key, this.locationCity}) : super(key: key);

  final String locationCity;

  @override
  State<StatefulWidget> createState() => new WeatherListBodyState();
}

///天气预报列表 状态
class WeatherListBodyState extends State<WeatherListBody> {
  //刷新
  Completer<Null> completer;

  //周天气数据
  var weekWeather;

  //星期对应转换数据
  var weekDayData = {
     '星期一' :1,
     '星期二' :2,    
     '星期三': 3,
     '星期四': 4,
     '星期五' :5, 
    '星期六': 6,
    '星期日': 7,
  };

  @override
  void initState() {
    super.initState();
    getWeekWeather();
  }

  @override
  Widget build(BuildContext context) {
    return new RefreshIndicator(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: weekWeather == null ? 0 : weekWeather.length,
          itemBuilder: (BuildContext context, int index) {
            return buildWeekWeatherItem(weekWeather[index]);
          }),
      onRefresh: _onRefresh,
    );
  }

  ///周天气视图Item
  Widget buildWeekWeatherItem(weatherItem) {
    var itemId = weatherItem['week'];
    var itemWeather = weatherItem['wea_img'];
    var minTemp = weatherItem['tem2'];
    var maxTemp = weatherItem['tem1'];
    //计算时间
    var now = new DateTime.now();
    var date = new DateTime(now.year, now.month, weekDayData[itemId] );
    var weekday = itemId;
    var dayTime = '${date.year}-${date.month}-${date.day}';
    //转换图标
   var itemWeatherIcon = 'res/icons/$itemWeather.webp';
    

    return new Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Colors.grey, width: 0.2, style: BorderStyle.solid))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "$weekday",
                style: TextStyle(fontSize: 20.0),
              ),
              new Text(
                "$dayTime",
                style: TextStyle(color: Colors.black45),
              ),
            ],
          ),
          new Text("$minTemp° ~ $maxTemp°"),
          new Image.asset(
            itemWeatherIcon,
            width: 32.0,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }

  ///刷新
  Future<Null> _onRefresh() async {
    completer = new Completer<Null>();
    getWeekWeather();
    return completer.future;
  }

  /// 获取一周的天气
  void getWeekWeather() async {
  
   
     
      setState(() {
        weekWeather = weatherdata['data'];
      });
    
    //刷新完毕
    if (completer != null && !completer.isCompleted) {
      completer.complete(null);
    }
  }
}
