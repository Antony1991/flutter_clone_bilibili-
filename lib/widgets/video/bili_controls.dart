/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-10 21:58:05
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-14 22:33:58
 * @FilePath: /flutter_clone_bilibili/lib/page/video/widgets/video_player.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_bilibili/common/style/theme.dart';
import 'package:flutter_clone_bilibili/widgets/video/video_play_button.dart';
import 'package:flutter_clone_bilibili/widgets/video/video_progress.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class BiliControls extends StatefulWidget {
  final String url;
  const BiliControls({required this.url, Key? key}) : super(key: key);

  @override
  State<BiliControls> createState() => _BiliControlsState();
}

class _BiliControlsState extends State<BiliControls>
    with SingleTickerProviderStateMixin {
  /// 判断当前视频播放状态
  late VideoPlayerValue _latestValue;
  final barHeight = 70.h;
  late VideoPlayerController controller;
  ChewieController? _chewieController;
  Timer? _initTimer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = VideoPlayerController.network(widget.url);
    // controller.initialize().then((value) {});s
  }

  Future _initialize() async {
    controller.addListener(() {});
    if (controller.value.isPlaying || _chewieController!.autoPlay) {
      print('hidelll');
    }
    if (_chewieController!.showControlsOnInitialize) {
      _initTimer = Timer(const Duration(milliseconds: 200), () {
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  /// 销毁
  void _dispose() {
    controller.removeListener(() {});
    _initTimer?.cancel();
  }

  @override
  void didChangeDependencies() {
    final oldController = _chewieController;
    _chewieController = ChewieController.of(context);
    controller = _chewieController!.videoPlayerController;
    if (oldController != _chewieController) {
      _dispose();
      _initialize();
    }
    super.didChangeDependencies();
  }

  /// 播放或者暂停
  playOrPause() {
    bool isFinished = _latestValue.position >= _latestValue.duration;

    /// didUpdateWidget与此处对应
    setState(() {
      if (controller.value.isPlaying) {
        controller.pause();
      } else {
        if (!controller.value.isInitialized) {
          controller.initialize().then((_) {
            controller.play();
          });
        } else {
          if (isFinished) {
            controller.seekTo(Duration.zero);
          }
          controller.play();
        }
      }
    });
  }

  /// 暂停/播放的按钮
  Widget _buildHitArea() {
    return GestureDetector(
      onTap: () {},
      child: VideoPlayButton(
        iconColor: GlobalTheme.norWhite02Color,
        isFinished: false,
        isPlaying: false,
        show: true,
        onPressed: playOrPause,
      ),
    );
  }

  /// 渲染进度条
  Widget _buildProgressBar() {
    return Expanded(
        child: ColoredBox(
            color: GlobalTheme.norGray02Color,
            child: VideoProgress(
              controller,
              barHeight: 3.h,
              handleHeight: 2.h,
              drawShadow: true,
              colors: _chewieController!.materialProgressColors ??
                  ChewieProgressColors(
                    playedColor: GlobalTheme.norMainThemeColors,
                    handleColor: const Color.fromRGBO(255, 255, 255, 1),
                    bufferedColor: const Color.fromRGBO(255, 255, 255, .6),
                    backgroundColor: const Color.fromRGBO(255, 255, 255, .3),
                  ),
            )));
  }

  /// 底部工具栏
  AnimatedOpacity _buildBottomBar() {
    return AnimatedOpacity(
        opacity: 1,
        duration: const Duration(milliseconds: 300),
        child: SafeArea(
          bottom: true,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10).r,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.1), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
            child: Row(
              children: [_buildHitArea(), _buildProgressBar()],
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    /// 检测鼠标移入移出
    return MouseRegion(
      /// 鼠标在区域内移动时的回调
      onHover: ((event) {}),
      child: GestureDetector(
        onTap: () {},
        onDoubleTap: () {},
        child: AbsorbPointer(
          child: Stack(
            children: [
              /// 底部工具栏
              Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: SizedBox(
                    height: barHeight,
                    child: _buildBottomBar(),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
