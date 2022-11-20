/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-10 18:11:01
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-20 16:10:18
 * @FilePath: /flutter_clone_bilibili/lib/page/video_play/video/video_play_page.dart
 * @Description: 视频播放页面
 */
import 'package:chewie/chewie.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_bilibili/common/style/theme.dart';
import 'package:flutter_clone_bilibili/model/FeedIndexModel.dart';
import 'package:flutter_clone_bilibili/page/video/video_profile/video_profile_page.dart';
import 'package:flutter_clone_bilibili/widgets/video/bili_controls.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class VideoPlayPage extends StatelessWidget {
  const VideoPlayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;
    FeedIndexItem videoData =
        ModalRoute.of(context)?.settings.arguments as FeedIndexItem;
    return SafeArea(
        child:
            VideoPlayContent(videoData: videoData, aspectRatio: aspectRatio));
  }
}

class VideoPlayContent extends StatefulWidget {
  final FeedIndexItem videoData;
  final double aspectRatio;
  const VideoPlayContent(
      {required this.videoData, required this.aspectRatio, Key? key})
      : super(key: key);

  @override
  State<VideoPlayContent> createState() => _VideoPlayContentState();
}

class _VideoPlayContentState extends State<VideoPlayContent>
    with AutomaticKeepAliveClientMixin {
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
      setState(() {});
    });
    super.initState();
  }

  Widget _buildVideoPlayer() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.topCenter,
      height: _chewieController != null
          ? width / _chewieController!.videoPlayerController.value.aspectRatio
          : 300.h,
      child: _chewieController != null &&
              _chewieController!.videoPlayerController.value.isInitialized
          ? Chewie(
              controller: _chewieController!,
            )
          : const Text('loading11'),
    );
  }

  /// tabview
  Widget _buildContentView() {
    return Expanded(
        child: Column(
      children: [_buildTabBar(), _buildTabView()],
    ));
  }

  /// tabbar
  Widget _buildTabBar() {
    return TabBar(
        labelColor: GlobalTheme.norMainThemeColors,
        indicatorColor: GlobalTheme.norMainThemeColors,
        unselectedLabelColor: GlobalTheme.unselectedLabelColor,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 3.h,
        tabs: const [Tab(text: '简介'), Tab(text: '评论')]);
  }

  Widget _buildTabView() {
    return Expanded(
        child: TabBarView(
      children: [_buildInfo(), _buildComment()],
    ));
  }

  Widget _buildInfo() {
    return VideoProfilePage(widget.videoData);
  }

  Widget _buildComment() {
    return EasyRefresh(
        onRefresh: () {
          print('111');
        },
        child: const Center(child: Text('评论')));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [_buildVideoPlayer(), _buildContentView()],
        )));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
