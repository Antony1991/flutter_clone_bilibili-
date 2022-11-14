/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-14 11:07:38
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-14 15:02:35
 * @FilePath: /flutter_clone_bilibili/lib/widgets/video/video_play_button.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_clone_bilibili/common/style/icons.dart';
import 'package:flutter_clone_bilibili/common/style/theme.dart';

class VideoPlayButton extends StatelessWidget {
  final Color? iconColor;
  final bool show;
  final bool isPlaying;
  final bool isFinished;
  final VoidCallback? onPressed;
  const VideoPlayButton(
      {this.iconColor,
      required this.show,
      required this.isPlaying,
      required this.isFinished,
      this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: show ? 1 : 0,
      duration: const Duration(milliseconds: 50),
      child: IconButton(
          onPressed: onPressed,
          icon: isFinished
              ? Image.asset(GlobalIcons.videoRePlay)
              : AnimatedPlayPause(playing: isPlaying, color: iconColor)),
    );
  }
}

class AnimatedPlayPause extends StatefulWidget {
  final double? size;
  final bool playing;
  final Color? color;
  const AnimatedPlayPause(
      {required this.playing, this.size, this.color, Key? key})
      : super(key: key);

  @override
  State<AnimatedPlayPause> createState() => _AnimatedPlayPauseState();
}

class _AnimatedPlayPauseState extends State<AnimatedPlayPause>
    with SingleTickerProviderStateMixin {
  late CurvedAnimation animation;
  late Animation iconAnimation;
  late final animationController = AnimationController(
      vsync: this,
      value: widget.playing ? 1 : 0,
      duration: const Duration(milliseconds: 1000));
  @override
  void initState() {
    super.initState();
    animation = CurvedAnimation(
        parent: animationController, curve: Curves.elasticInOut);
    iconAnimation = Tween(
            begin: -GlobalTheme.xLargeFontSize,
            end: -GlobalTheme.xLargeFontSize)
        .animate(animation);
  }

  @override
  void didUpdateWidget(covariant AnimatedPlayPause oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (widget.playing != oldWidget.playing) {
      if (widget.playing) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
          animation: iconAnimation,
          builder: ((context, child) {
            return Image.asset(
              widget.playing
                  ? GlobalIcons.videoCanPause
                  : GlobalIcons.videoCanPlay,
              width: iconAnimation.value > 0
                  ? iconAnimation.value
                  : -iconAnimation.value,
              height: iconAnimation.value > 0
                  ? iconAnimation.value
                  : -iconAnimation.value,
            );
          })),
    );
  }
}
