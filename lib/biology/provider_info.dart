import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:plece/biology/biaoqian.dart';
import 'package:plece/timeline/time_line.dart';

import 'text_expand.dart';
String info_text="鲨鱼属于脊椎动物门软骨纲(Chondrichthyes)板鳃亚纲，海生，少数种类进入淡水，为一群游速快的中大型海洋鱼类。 [1] 鲨内骨骼完全由软骨组成，常钙化，但无任何真骨头组织，外骨骼不很发达或退化，身体常被皮齿(质鳞)，牙多样化，具有硬肌，但膜骨则永不存在，脑颅无缝。上额由腭方软骨组成，下额由梅氏软骨组成。最新研究表明，鲨体内含有多种生物活性成分，如抗癌因子、角鲨烯、黏多糖等等。鲨药用始见于《本草经集注》，在中国民间，鲨软骨提取物、鲨肝油等早已被用于治疗癌症等疾病。";
class ProductInfoPage extends StatelessWidget {
  const ProductInfoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
        body: Column(
          
          children: [
           Image(image: AssetImage("images/7.jfif",),fit: BoxFit.fill,),


            Expanded(child: TopTabPage1()),
          ],
        )
 
        

    );
  }
}

class TopTabPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
                ),),
        child: Scaffold(
          
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            toolbarHeight: 20,  
            shadowColor: Colors.white,
            flexibleSpace: TabBar(tabs: [
              Tab(
                child: Text("关于",style: TextStyle(color: Colors.black),),
              ),
              Tab(
              child: Text("基本状态",style: TextStyle(color: Colors.black),),
    
              ),
              Tab(
              child: Text("进化",style: TextStyle(color: Colors.black),),
 
              ),
              Tab(
              child: Text("标签",style: TextStyle(color: Colors.black),),
    
              ),
            ]),
          ),
          body: TabBarView(
          children: [
            Center(
              child: Expanded(child: 
              ListView(children: [
                SizedBox(height: 10,),
               OPRichText(
               text:info_text,
              width: 400,
               textColor: Color(0xFF7ACFD6),
               ),
              Card(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40))),
                shadowColor: Colors.black12,
                child:Container(
                  height: 80,
                  child:Row(children: [
                    SizedBox(width: 50,),
                    Column(children: [MyText("Weight"),SizedBox(height:10),MyText("27kg")],), 
                    SizedBox(width: 150,),
                    Column(children: [MyText("Height"),SizedBox(height:10),MyText("23.1cm")],
                    )
                  ],)
                        
                 
                )
              ) ,
           
               Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                     Row(children: [Text("Breeding",style: TextStyle(fontWeight: FontWeight.bold),),],) ,
                     SizedBox(height:10),
                     Row(children: [ Text("Gender               Male87%              Female13%"),],) ,
                     SizedBox(height:10),
                     Row(children: [Text("繁殖方式              胎生                 卵生"),],) ,
                     SizedBox(height:10),
                     Row(children: [Text("栖息地                浅海              "),],) ,
                     SizedBox(height:20),
                     Row(children: [Text("位置",style: TextStyle(fontWeight: FontWeight.bold),),],) ,
                     SizedBox(height: 10,),
                     Container(
                       height: 200,
                       width: 400,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                       image: DecorationImage(image:AssetImage("images/2.jpg"),fit: BoxFit.fill ),
                       ),
                       )
                    ],
                  ),
                
              

              ],)
              
              ,)
            
            
            ),
            Center(
              
              child: Expanded(
             child: ListView(
               padding: EdgeInsets.only(left:55,top: 20),
               children: [
                 Row(children: [Text("hp            80 "),JinDuTiao(Colors.brown,0.5)],),
                 SizedBox(height:20),
                 Row(children: [Text("defence  80 "),JinDuTiao(Colors.blueAccent,0.7)],),
                 SizedBox(height:20),
                 Row(children: [Text("attack     80 "),JinDuTiao(Colors.red,0.8)],),
                 SizedBox(height:20),
                 Row(children: [Text("hp            80 "),JinDuTiao(Colors.greenAccent,0.4)],),
                 SizedBox(height:20),
                 Row(children: [Text("speed      90 "),JinDuTiao(Colors.orange,0.6)],),
                 SizedBox(height:40),
                 Row(children:[BoldText("Ability"),SizedBox(width:120),Text("overgrow")]) ,
                 SizedBox(height:20),
                 Row(children:[BoldText("生活习惯"),SizedBox(width:120),Text("overgrow")]) ,
                 SizedBox(height:20),
                 Row(children:[BoldText("颜色"),SizedBox(width:120),Text("blue")]) ,
              ],),
            
            ),
            
            
            ),
            Center(child: MyTimeline()),
            Center(child: TextWarpTagPage()),
          ]),
        ),
      ),
    );
  }
}

Widget MyText(String text){
  return Text(text,style: TextStyle(fontSize: 17,),);
}
Widget BoldText(String tex)
{
   return Text(tex,style: TextStyle(fontWeight: FontWeight.bold),);
}
Widget JinDuTiao(Color color,double per){
  return new LinearPercentIndicator(
        width: 200,
        lineHeight: 8.0,
        percent: per,
        backgroundColor: Colors.blue[100],
        progressColor: color,
  );
}