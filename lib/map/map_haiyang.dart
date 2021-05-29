
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class MyMap{
   static Future<bool> gotoBaiduMap() async {
    var url="baidumap://map/place/search?query=海洋&region=chongqing&location=29.54113,106.45752&radius=1000&src=andr.baidu.openAPIdemo";
    bool canLaunchUrl = await canLaunch(url);
 
    if (!canLaunchUrl) {
      return false;
    }
 
    await launch(url);
 
    return canLaunchUrl;
  }
}