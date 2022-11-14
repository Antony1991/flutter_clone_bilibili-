/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-10 21:58:05
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-13 22:14:02
 * @FilePath: /flutter_clone_bilibili/lib/page/video/widgets/video_player.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  // late Player
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
          child: Stack(),
        ),
      ),
    );
  }
}
