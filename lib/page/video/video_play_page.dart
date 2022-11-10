/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-10 18:11:01
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-10 18:19:47
 * @FilePath: /flutter_clone_bilibili/lib/page/video_play/video/video_play_page.dart
 * @Description: 视频播放页面
 */
import 'package:flutter/material.dart';

class VideoPlayPage extends StatefulWidget {
  const VideoPlayPage({super.key});

  @override
  State<VideoPlayPage> createState() => _VideoPlayPageState();
}

class _VideoPlayPageState extends State<VideoPlayPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('video'),
      ),
    );
  }
}
