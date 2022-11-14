/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-14 19:24:37
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-14 22:38:25
 * @FilePath: /flutter_clone_bilibili/lib/widgets/video/video_progress.dart
 * @Description: 视频播放的进度条
 */
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clone_bilibili/common/style/icons.dart';
import 'package:video_player/video_player.dart';
import 'dart:ui' as ui;

class VideoProgress extends StatefulWidget {
  final VideoPlayerController controller;
  final ChewieProgressColors? colors;

  /// 回调函数
  final VoidCallback? onDragStart;
  final VoidCallback? onDragEnd;
  final VoidCallback? onDragUpdate;

  final double barHeight;
  final double handleHeight;
  final bool drawShadow;
  const VideoProgress(this.controller,
      {this.colors,
      this.onDragEnd,
      this.onDragStart,
      this.onDragUpdate,
      required this.barHeight,
      required this.handleHeight,
      required this.drawShadow,
      Key? key})
      : super(key: key);

  @override
  State<VideoProgress> createState() => _VideoProgressState();
}

class _VideoProgressState extends State<VideoProgress> {
  /// 进度条图片
  Image? image;
  bool _controllerWasPlaying = false;

  VideoPlayerController get controller => widget.controller;
  void listener() {
    if (!mounted) {
      return;
    }
    setState(() {});
  }

  /// 获取资源图片
  Future loadAssetImage(String path) async {
    // 加载资源文件
    final data = await rootBundle.load(path);
    // 把资源文件转为uint8list类型
    final bytes = data.buffer.asUint8List();
    // 解析uint8list
    final image = await decodeImageFromList(bytes);
    this.image = image as Image?;
    return image;
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    controller.removeListener(listener);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(listener);
  }

  void _seekToRelativePosition(Offset globalPosition) {
    final box = context.findRenderObject()! as RenderBox;
    final Offset tapPos = box.globalToLocal(globalPosition);
    final double relative = tapPos.dx / box.size.width;
    final Duration position = controller.value.duration * relative;
    controller.seekTo(position);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /// 开始拖动
      onHorizontalDragStart: (details) {
        if (!controller.value.isInitialized) {
          return;
        }
        _controllerWasPlaying = controller.value.isPlaying;
        if (_controllerWasPlaying) {
          controller.pause();
        }
        widget.onDragStart?.call();
      },
      onHorizontalDragUpdate: (details) {
        if (!controller.value.isInitialized) {
          return;
        }
        _seekToRelativePosition(details.globalPosition);
        widget.onDragUpdate?.call();
      },
      onHorizontalDragEnd: (details) {
        if (_controllerWasPlaying) {
          controller.play();
        }
        widget.onDragEnd?.call();
      },
      onTapDown: (details) {
        if (!controller.value.isInitialized) {
          return;
        }
        _seekToRelativePosition(details.globalPosition);
      },
      child: FutureBuilder(
        /// 加载进度条顶部的图片
        future: loadAssetImage(GlobalIcons.videoProgress),
        builder: (context, snapshot) {
          print("start=========${snapshot.data}");
          return snapshot.data != null
              ? Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.transparent,
                    child: CustomPaint(
                      painter: _ProgressBarPaint(
                        barHeight: widget.barHeight,
                        handleHeight: widget.handleHeight,
                        assetsImage: snapshot.data!,
                        value: controller.value,
                        colors: widget.colors ?? ChewieProgressColors(),
                        drawShadow: widget.drawShadow,
                      ),
                    ),
                  ),
                )
              : const SizedBox();
        },
      ),
    );
  }
}

class _ProgressBarPaint extends CustomPainter {
  final double barHeight;
  final double handleHeight;
  final bool drawShadow;
  final ui.Image assetsImage;
  final VideoPlayerValue value;
  final ChewieProgressColors colors;
  const _ProgressBarPaint(
      {required this.assetsImage,
      required this.barHeight,
      required this.handleHeight,
      required this.drawShadow,
      required this.value,
      required this.colors});

  @override
  bool shouldRepaint(CustomPainter paint) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final baseOffset = size.height / 2 - barHeight / 2;
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromPoints(Offset(0, baseOffset),
                Offset(size.width, baseOffset + barHeight)),
            const Radius.circular(4)),
        colors.backgroundPaint);
    if (!value.isInitialized) {
      return;
    }

    /// 播放时长占比
    final double playedPartPercent =
        value.position.inMilliseconds / value.duration.inMilliseconds;

    /// 播放的长度
    final double playedPart =
        playedPartPercent > 1 ? size.width : playedPartPercent * size.width;

    for (final DurationRange range in value.buffered) {
      final double start = range.startFraction(value.duration) * size.width;
      final double end = range.endFraction(value.duration) * size.width;

      /// 视频缓存进度条
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromPoints(Offset(start, baseOffset),
                  Offset(end, baseOffset + barHeight)),
              const Radius.circular(4)),
          colors.bufferedPaint);
    }

    /// 视频播放的进度条
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromPoints(Offset(0, baseOffset),
                Offset(playedPart, baseOffset + barHeight)),
            const Radius.circular(4)),
        colors.playedPaint);

    if (drawShadow) {
      final Path shadowPath = Path()
        ..addOval(Rect.fromCircle(
            center: Offset(playedPart, baseOffset + barHeight / 2),
            radius: handleHeight));
      canvas.drawShadow(shadowPath, Colors.black, .2, false);
    }

    canvas.drawImage(
        assetsImage,
        Offset(playedPart - barHeight * 2, baseOffset - barHeight),
        colors.handlePaint);
  }
}
