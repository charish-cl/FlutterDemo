import 'package:flutter/material.dart';
import 'package:plece/main.dart';
List answerpage=['A','B'];
var score;
var answermap={
'A':1,
'B':2,
'C':3,
'D':4,
};
List<Map> questions=[
  {
    "question":"为什么珊瑚会褪色",
    "A":"化学性质不稳定",
    "B":"物理性质不稳定",
    "C":"性质不稳定",
    "D":"不稳定",
  },
  {
    "question":"为什么鲨鱼",
    "A":"不稳定",
    "B":"物理性质不稳定",
    "C":"性质不稳定",
    "D":"不稳定",
  }

];
int curindex=0;
class AnswerPage extends StatefulWidget {
  AnswerPage({Key key}) : super(key: key);

  @override
  _AnswerPageState createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  @override
  void initState() { 
    if(groupValue.length==0)
    for (int i = 0; i < questions.length; i++) {
      groupValue.add(0);
    }
    else{
        for (var i = 0; i < groupValue.length; i++) {
        groupValue[i]=0;
        }
    }
    score=0;
  }
  bool valued=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body:ListView(children: [
            SizedBox(height: 50,),
            ListTile(title: Text(questions[curindex]["question"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),),
            SizedBox(height: 20,),
            Center(
              child: Container(
                height: 200,
                width: 340,
                child: Card(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(20)),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  "images/2.jpg",
                  fit: BoxFit.fill,
                ),
          ),
              ),
            ),
        
            SizedBox(height: 20,),
          
            Radiobox(A: questions[curindex]['A'],
            B: questions[curindex]['B'],
            C: questions[curindex]['C'],
            D:questions[curindex]['D']),
            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              height: 100,
              child: Stack(children: [
                Positioned(
                left: 50,
                child: 
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                       width: 100,
                       child: ElevatedButton( onPressed: () { setState(() {
                         if(curindex>0) 
                         curindex--;
                       }); },
                       child:Text("上一题")),
                   ),
                ),),
                Positioned(
                right: 50,
                child: 
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                       width: 100,
                       child: ElevatedButton( onPressed: () { setState(() {
                         if(curindex<questions.length-1)
                         curindex++;
                        
                       }); },
                       child:Text("下一题")),
                   ),
                ),)
              ],),
            ),
            SizedBox(height:100),
            Center(child: SizedBox(
              width: 100,
              child: Hero(
                  tag: Succeed(),
                  child: FlatButton(onPressed: (){
                  print(groupValue.length);
                  for (var i = 0; i <groupValue.length; i++) {
                   if(groupValue[i]==answermap[answerpage[i]])
                   {
                     score+=10;
                   }
                  }
                 Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context)=>Succeed(),
                      )
                  );

                }, child:  Text("提交"),
                color: Colors.orangeAccent,
                ),
              )
              )
              )
          ],)
    );
  }
}

class Positoned {
}
class MyCheckBox extends StatefulWidget {
  MyCheckBox({Key key,this.tex}) : super(key: key);
  Text tex;
  @override
  _MyCheckBoxState createState() => _MyCheckBoxState();
}
class _MyCheckBoxState extends State<MyCheckBox> {
   bool valued=false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
          title: widget.tex,
          value: valued, 
          onChanged: (bool value) {
            setState(() {
              valued = value; 
            });
          },
  );
  }
}
List groupValue=[];
class Radiobox extends StatefulWidget {
  const Radiobox({Key key,this.A,this.B,this.C,this.D}) : super(key: key);
 
 final String  A;
 final String  B;
 final String  C;
 final String  D;
  @override
  _RadioboxState createState() => _RadioboxState();
}

class _RadioboxState extends State<Radiobox> {

  @override 
  Widget build(BuildContext context) {
    ///单选框的成组使用
  
    return Column(children: [
      Row(
        children: [
          SizedBox(width: 30,),
          Radio(
            ///此单选框绑定的值 必选参数
            value: 1,
            ///当前组中这选定的值  必选参数
            groupValue: groupValue[curindex],
            ///点击状态改变时的回调 必选参数
            onChanged: (v) {
              setState(() {
                groupValue[curindex] = v;
              });
            },
          ),
          Text("A") ,
          SizedBox(width: 20,),
          Text(widget.A),
          SizedBox(width: 50,),
        ],
      ),
      Row(
        children: [
          SizedBox(width: 30,),
          Radio(
            ///此单选框绑定的值 必选参数
            value: 2,
            ///当前组中这选定的值  必选参数
             groupValue: groupValue[curindex],
            ///点击状态改变时的回调 必选参数
            onChanged: (v) {
              setState(() {
                groupValue[curindex] = v;
              });
            },
          ),
          Text("B") ,
          SizedBox(width: 20,),
          Text(widget.B),
          SizedBox(width: 50,),
        ],
      ),
      Row(
        children: [
          SizedBox(width: 30,),
          Radio(
            ///此单选框绑定的值 必选参数
            value: 3,
            ///当前组中这选定的值  必选参数
             groupValue: groupValue[curindex],
            ///点击状态改变时的回调 必选参数
            onChanged: (v) {
              setState(() {
                groupValue[curindex] = v;
              });
            },
          ),
          Text("C") ,
          SizedBox(width: 20,),
          Text(widget.C),
          SizedBox(width: 50,),
        ],
      ),
      Row(
        children: [
          SizedBox(width: 30,),
          Radio(
            ///此单选框绑定的值 必选参数
            value: 4,
            ///当前组中这选定的值  必选参数
             groupValue: groupValue[curindex],
            ///点击状态改变时的回调 必选参数
            onChanged: (v) {
              setState(() {
                groupValue[curindex] = v;
              });
            },
          ),
          Text("D") ,
          SizedBox(width: 20,),
          Text(widget.D),
          SizedBox(width: 50,),
        ],
      ),
     
    ],
    );
}}

class Succeed extends StatefulWidget {
  Succeed({Key key}) : super(key: key);

  @override
  _SucceedState createState() => _SucceedState();
}

class _SucceedState extends State<Succeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          SizedBox(height: 200,),
          Center(child: Text("你获得了$score分!",style: TextStyle(fontSize: 30),),),
          SizedBox(height: 40,),
          SizedBox(
              width: double.infinity,
              height: 100,
              child: Stack(children: [
                Positioned(
                left: 50,
                child: 
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                       width: 100,
                       child: ElevatedButton( onPressed: () {
                        
                        setState(() {
                        score=0;
                        curindex=0;
                      
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context)=>AnswerPage(),
                            )
                        );
                        });
                        
                       },
                       child:Text("再次答题")),
                   ),
                ),),
                Positioned(
                right: 50,
                child: 
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                       width: 100,
                       child: ElevatedButton( onPressed: () { 
                         Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context)=>MyHomePage(),
                            )
                        );
                       },
                       child:Text("结束")),
                   ),
                ),)
              ],),
            ),
        ],
      ),

    );
  }
}