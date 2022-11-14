/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-10 18:11:01
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-14 22:01:57
 * @FilePath: /flutter_clone_bilibili/lib/page/video_play/video/video_play_page.dart
 * @Description: 视频播放页面
 */
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_bilibili/widgets/video/bili_controls.dart';
import 'package:video_player/video_player.dart';

class VideoPlayPage extends StatefulWidget {
  const VideoPlayPage({super.key});

  @override
  State<VideoPlayPage> createState() => _VideoPlayPageState();
}

class _VideoPlayPageState extends State<VideoPlayPage> {
  ChewieController? _chewieController;
  late VideoPlayerController _playerController;

  @override
  void initState() {
    String url =
        "https://assets.mixkit.co/videos/preview/mixkit-spinning-around-the-earth-29351-large.mp4";

    /// 视频初始化
    _playerController = VideoPlayerController.network(url);
    _playerController.initialize().then((value) {
      _chewieController = ChewieController(
          videoPlayerController: _playerController,
          allowMuting: false,
          autoPlay: false,
          customControls: BiliControls(
            url: url,
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: 300,
        child: _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
            ? Chewie(
                controller: _chewieController!,
              )
            : const Text('loading11'),
      ),
    );
  }
}
