import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
//视频播放器封装需要使用动态类
class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

//继承VideoApp类
class _VideoAppState extends State<VideoApp> {

  //定义一个VideoPlayerController
  VideoPlayerController _controller;

  //重写类方法initState()，初始化界面
  @override
  void initState() {
    super.initState();
    //设置视频参数 (..)是级联的意思
    _controller = VideoPlayerController.network(
       "https://www.bilibili.com/video/BV1j54y1b7qv?spm_id_from=333.851.b_7265636f6d6d656e64.6"
        )
        ..initialize().then((_) {
        // 确保在初始化视频后显示第一帧，直至在按下播放按钮。
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: Center(
          //  _controller.value.initialized表示视频是否已加载并准备好播放，
          // 如果是true则返回AspectRatio（固定宽高比的组件,宽高比为视频本身的宽高比）
          // VideoPlayer为视频插放器，对像就是前面定义的_controller
          child: _controller.value.isInitialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )

          //如果视频没有加载好或者因网络原因加载不出来则返回Container 组件
          //一般用于放置过渡画面
              : Container(
            child: Text("没有要播放的视频"),
          ),
        ),

        //右下角图标按钮onPressed中需要调用setState方法，用于刷新界面
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              //_controller.value.isPlaying：判断视频是否正在播放
              //_controller.pause()：如果是则暂停视频。
              // _controller.play():如果不是则播放视频
              _controller.value.isPlaying
                  ? _controller.pause(): _controller.play();
            });
          },

          //子组件为按钮图标
          //_controller.value.isPlaying：判断视频是否正在播放
          //Icons.pause：如果是则显示这个图标
          //Icons.play_arrow：如果不是，则显示这个图标
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      );
    
  }

  //dispose():程序中是用来关闭一个GUI页面的
  //视频播放完需要把页面关闭
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}