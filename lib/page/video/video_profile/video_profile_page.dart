/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-17 21:41:18
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-17 22:11:12
 * @FilePath: /flutter_clone_bilibili/lib/page/video/video_profile/video_profile_page.dart
 * @Description: 视频简介
 */
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_bilibili/page/video/widgets/video_info.dart';

class VideoProfilePage extends StatefulWidget {
  const VideoProfilePage({super.key});

  @override
  State<VideoProfilePage> createState() => _VideoProfilePageState();
}

class _VideoProfilePageState extends State<VideoProfilePage> {
  /// 视频信息
  Widget _buildVideoInfo() {
    return const VideoInfo();
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(children: [_buildVideoInfo()]),
        ),
      ),
    );
  }
}
