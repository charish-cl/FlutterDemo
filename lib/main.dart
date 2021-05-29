import 'dart:async';

import 'package:flutter/material.dart';
import 'package:plece/2048/home.dart';
import 'package:plece/biology/provider_info.dart';
import 'package:plece/book/mainbook.dart';
import 'package:plece/book/screens/home_screen.dart';
import 'package:plece/map/map_haiyang.dart';
import 'package:plece/question.dart';
import 'package:plece/swipper.dart';
import 'package:plece/test.dart';
import 'package:plece/timeline/time_line.dart';
import 'package:plece/video.dart';
import 'package:plece/weather/home.dart';
import 'package:timelines/timelines.dart';

import 'biology/provider.dart';

Future<Null> main() async {
  FlutterError.onError = (FlutterErrorDetails details) async {
    Zone.current.handleUncaughtError(details.exception, details.stack);
  };

  runZoned<Future<void>>(() async {
    runApp(MyApp());
  }, onError: (error, stackTrace) async {
    await _reportError(error, stackTrace);
  });
}

Future<Null> _reportError(dynamic error, dynamic stackTrace) async {
  print('catch error=' + error);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage());
  }
}
final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      backgroundColor: Colors.blue,
      icon: Icon(Icons.home),
      label: "主页"
    ),
    BottomNavigationBarItem(
      // backgroundColor: Colors.green,
      icon: Icon(Icons.settings),
      label: "设置"
    ),
    
  ];
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: 0,
       
        onTap: (index) {
          // _changePage(index);
        },
      ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Center(child: SizedBox(child: MySwipper(),height: 220,width: 340,)),
                  SizedBox(
                    height: 25,
                  ),
                  HomeCard()
                ],
              ),
            ),
          ],
        ));
  }
}

class HomeCard extends StatelessWidget {
  HomeCard({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        
        
        child:CustomPaint(
              size:Size(280.0,600) ,
              painter: MyPainter(),
              child: Wrap(
              children: <Widget>[
                ButtonCard(
                  name: "海洋图鉴",
                  image: AssetImage("images/icons/1.png"),
                  newpage: ProvidePage(),
                ),
                ButtonCard(
                  name: "图书馆",
                  image: AssetImage("images/icons/4.png"),
                  newpage: HomeScreen(),
                ),
                ButtonCard(
                  name: "天气",
                  image: AssetImage("images/icons/2.png"),
                  newpage: WeatherPage(),
                ),
                FunctionButtonCard(
                  name: "海洋馆",
                  image: AssetImage("images/icons/7.png"),
                  func: (){
                    MyMap.gotoBaiduMap();
                  },
                ),
                ButtonCard(
                  name: "答题",
                  image: AssetImage("images/icons/5.png"),
                  newpage:AnswerPage(),
                ),
                ButtonCard(
                  name: "小游戏",
                  image: AssetImage("images/icons/6.png"),
                  newpage: HomePage(),
                ),
              ]),
        ),
      ),
    );
  }
}

class ButtonCard extends StatelessWidget {
  final String name;
  final Widget newpage;
  final AssetImage image;
  const ButtonCard({Key key, this.name, this.image, this.newpage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 140,
      child: InkWell(

        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return this.newpage;
          }));
        },
        child: Column(
          children: [
          SizedBox(child: Image(image: image),height: 80,width: 80,),
          SizedBox(height: 20,),
          Text(this.name,style: TextStyle(color: Colors.black),)
          ],
          )
      ),
    );
  }
}
class FunctionButtonCard extends StatelessWidget {
  final String name;
  final Function func;
  final AssetImage image;
  const FunctionButtonCard({Key key, this.name, this.image, this.func})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
      return Container(
      height: 140,
      width: 140,
      child:InkWell(

        onTap: () { func(); },
        child: Column(
          children: [
          SizedBox(child: Image(image: image),height: 80,width: 80,),
          SizedBox(height: 20,),
          Text(this.name,style: TextStyle(color: Colors.black),)
          ],
          )
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = size.width / 2;
    double eHeight = size.height / 3;

    //網格背景
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill //填充
      ..color = Color(0xfff6f6f6); //背景为纸黄色
    canvas.drawRect(Offset.zero & size, paint);

    //網格風格
    paint
      ..style = PaintingStyle.stroke //线
      ..color = Color(0xffe1e9f0)
      ..strokeWidth = 1.1;

    for (int i = 0; i <= 40; ++i) {
      double dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }

    for (int i = 0; i <= 20; ++i) {
      double dx = eWidth * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }



  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}