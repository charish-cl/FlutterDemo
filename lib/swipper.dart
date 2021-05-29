
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
List<String> img=[
"images/background1.jpg","images/3.jfif","images/2.jpg"
];

class MySwipper extends StatefulWidget {
  MySwipper({Key key}) : super(key: key);

  @override
  _MySwipperState createState() => _MySwipperState();
}

class _MySwipperState extends State<MySwipper> {
  @override
  Widget build(BuildContext context) {
    return  Card(
       clipBehavior: Clip.antiAlias,
       shape: RoundedRectangleBorder(
       borderRadius: BorderRadiusDirectional.circular(20)),
          child: Swiper(
        autoplay: true,
          itemBuilder: (BuildContext context,int index){
            return new Image.asset(img[index],fit: BoxFit.fill,);
          },
          itemCount: 3,
          pagination: new SwiperPagination()
      ),
    );
  }
}