import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
class MyTimeline extends StatefulWidget {
  MyTimeline({Key key}) : super(key: key);
  @override
  _MyTimelineState createState() => _MyTimelineState();
}

class _MyTimelineState extends State<MyTimeline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Timeline.tileBuilder(
        builder: TimelineTileBuilder.fromStyle(
          contentsAlign: ContentsAlign.alternating,
          contentsBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(content[index].toString()),
          ),
          itemCount: 5,
        ),
      ),
    );
  }
}

List content=[
  
    "关于鲨鱼的起源可以追溯到石炭纪，在这之前，只有全头亚纲，而在泥盆纪，有一支演化出了最早的板鳃亚纲，他叫裂口鲨"
  ,
  
    "弓鲛最早出现在石炭纪，它们的牙齿形状呈“山”字型，最长可达2米，两个背鳍的前侧各有一根硬刺，它们存在的时间很长，白垩纪时期都能看到它们的身影"
  ,
  
    "然而有一种更庞大的总鳍鱼，含肺鱼会把他们当成捕食的对象，不过，弓鲛依然扛过了二叠纪大灭绝"
  ,
  
    "时间线来到二叠纪，这时出现了一种奇特的鲨鱼，旋齿鲨"
  ,
  
    "时间线来到白垩纪，白垩纪晚期(一亿年前)兴起了一种大型鼠鲨科代表---白垩刺甲鲨。Cretoxyrhina mantelli , 平均能长达5~7.6米 , 跟现生的大白鲨的身型相仿 , 这时期大量白垩纪鲨鱼仅从牙齿化石得知。相反 , 不少白垩刺甲鲨的完整椎骨化石已被发现 , 这惊人的化石发现包括了脱节的椎骨化石串及弓型的上下颚 , 提供了一个生动的鲨鱼长度及嘴部的宽度。值得注意的是 , 古生物学家还发现了至少属于白垩刺甲鲨已矿物化的皮肤---带有齿状的皮肤化石。"
  ,
  
];