/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-10 21:58:05
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-15 20:14:13
 * @FilePath: /flutter_clone_bilibili/lib/page/video/widgets/video_player.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clone_bilibili/common/style/icons.dart';
import 'package:flutter_clone_bilibili/common/style/theme.dart';
import 'package:flutter_clone_bilibili/provider/player_provider.dart';
import 'package:flutter_clone_bilibili/widgets/video/video_play_button.dart';
import 'package:flutter_clone_bilibili/widgets/video/video_progress.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class BiliControls extends StatefulWidget {
  final String url;
  const BiliControls({required this.url, Key? key}) : super(key: key);

  @override
  State<BiliControls> createState() => _BiliControlsState();
}

class _BiliControlsState extends State<BiliControls>
    with SingleTickerProviderStateMixin {
  late PlayerProvider notifier;

  /// 判断当前视频播放状态
  late VideoPlayerValue _latestValue;
  final barHeight = 50.h;
  late VideoPlayerController controller;
  ChewieController? _chewieController;
  Timer? _initTimer;
  bool _displayTapped = false;
  Timer? _hideTimer;
  void _updateState() {
    if (mounted) {
      setState(() {
        _latestValue = controller.value;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifier = Provider.of<PlayerProvider>(context, listen: false);
    controller = VideoPlayerController.network(widget.url);
    // controller.initialize().then((value) {});s
  }

  Future _initialize() async {
    controller.addListener(_updateState);
    _updateState();
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
    print("position======${_latestValue.position}");
    print("duration======${_latestValue.duration}");
    final bool isFinished = _latestValue.position >= _latestValue.duration;
    final bool showPlayButton = !notifier.hideStuff;
    return GestureDetector(
      onTap: () {
        if (_latestValue.isPlaying) {
          if (_displayTapped) {
            setState(() {
              notifier.hideStuff = true;
            });
          } else {
            _cancelAndRestartTimer();
          }
        } else {
          playOrPause();
          setState(() {
            notifier.hideStuff = true;
          });
        }
      },
      child: VideoPlayButton(
        iconColor: GlobalTheme.norWhite02Color,
        isFinished: isFinished,
        isPlaying: controller.value.isPlaying,
        show: showPlayButton,
        onPressed: playOrPause,
      ),
    );
  }

  /// 渲染进度条
  Widget _buildProgressBar() {
    return Expanded(
        flex: 1,
        child: VideoProgress(
          controller,
          barHeight: 3.h,
          handleHeight: 2.h,
          drawShadow: false,
          colors: _chewieController!.materialProgressColors ??
              ChewieProgressColors(
                playedColor: GlobalTheme.norMainThemeColors,
                handleColor: const Color.fromRGBO(255, 255, 255, 1),
                bufferedColor: const Color.fromRGBO(255, 255, 255, .6),
                backgroundColor: const Color.fromRGBO(255, 255, 255, .3),
              ),
        ));
  }

  String formatDuration(Duration position) {
    final ms = position.inMilliseconds;
    int seconds = ms ~/ 1000;
    final int hours = seconds ~/ 3600;
    seconds = seconds % 3600;
    final minutes = seconds ~/ 60;
    seconds = seconds % 60;

    final hoursString = hours >= 10
        ? '$hours'
        : hours == 0
            ? '00'
            : '0$hours';
    final minutesString = minutes >= 10
        ? '$minutes'
        : minutes == 0
            ? '00'
            : '0$minutes';
    final secondsString = seconds >= 10
        ? '$seconds'
        : seconds == 0
            ? '00'
            : '0$seconds';
    final formattedTime =
        '${hoursString == '00' ? '' : '$hoursString:'}$minutesString:$secondsString';
    return formattedTime;
  }

  /// 视频播放的时长及当前位置
  Widget _buildPosition() {
    final position = _latestValue.position;
    final duration = _latestValue.duration;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15).r,
      child: RichText(
          text: TextSpan(
              text: '${formatDuration(position)} ',
              children: [
                TextSpan(
                    text: '/ ${formatDuration(duration)}',
                    style: TextStyle(
                        fontSize: GlobalTheme.xxxSmallFontSize,
                        color: GlobalTheme.norWhite02Color.withOpacity(.9)))
              ],
              style: TextStyle(
                  fontSize: GlobalTheme.xxxSmallFontSize,
                  color: GlobalTheme.norWhite02Color.withOpacity(.9)))),
    );
  }

  /// 全屏按钮
  _buildExpandButton() {
    return GestureDetector(
      onTap: () {},
      child: AnimatedOpacity(
          opacity: 1,
          duration: const Duration(milliseconds: 300),
          child: _chewieController!.isFullScreen
              ? const Icon(Icons.fullscreen_exit,
                  color: GlobalTheme.norWhite02Color)
              : Image.asset(
                  GlobalIcons.videoFullScreen,
                  width: 23.w,
                  height: 23.h,
                )),
    );
  }

  /// 底部工具栏
  AnimatedOpacity _buildBottomBar() {
    return AnimatedOpacity(
        opacity: notifier.hideStuff ? 0 : 1,
        duration: const Duration(milliseconds: 300),
        child: SafeArea(
          bottom: _chewieController!.isFullScreen,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10).r,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.1), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
            child: Row(
              children: [
                _buildHitArea(),
                _buildProgressBar(),
                _buildPosition(),
                _buildExpandButton()
              ],
            ),
          ),
        ));
  }

  void _cancelAndRestartTimer() {
    _hideTimer?.cancel();
    _startHideTimer();

    setState(() {
      notifier.hideStuff = false;
      _displayTapped = true;
    });
  }

  void _startHideTimer() {
    final hideControlsTimer = _chewieController!.hideControlsTimer.isNegative
        ? ChewieController.defaultHideControlsTimer
        : _chewieController!.hideControlsTimer;

    /// 过一段时间隐藏
    _hideTimer = Timer(hideControlsTimer, () {
      setState(() {
        notifier.hideStuff = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    /// 检测鼠标移入移出
    return MouseRegion(
      /// 鼠标在区域内移动时的回调
      onHover: ((event) {
        print("hover");
        _cancelAndRestartTimer();
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
            overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
        _cancelAndRestartTimer();
      }),
      child: GestureDetector(
        onTap: () {
          _cancelAndRestartTimer();
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
              overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
          _cancelAndRestartTimer();
        },
        onDoubleTap: () {},
        child: AbsorbPointer(
          absorbing: notifier.hideStuff,
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
