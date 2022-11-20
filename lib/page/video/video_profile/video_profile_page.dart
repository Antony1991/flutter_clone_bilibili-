/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-17 21:41:18
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-20 16:23:49
 * @FilePath: /flutter_clone_bilibili/lib/page/video/video_profile/video_profile_page.dart
 * @Description: 视频简介
 */
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_bilibili/common/style/icons.dart';
import 'package:flutter_clone_bilibili/common/style/theme.dart';
import 'package:flutter_clone_bilibili/model/FeedIndexModel.dart';
import 'package:flutter_clone_bilibili/page/video/widgets/video_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoProfilePage extends StatefulWidget {
  final FeedIndexItem videoData;
  const VideoProfilePage(this.videoData, {Key? key}) : super(key: key);

  @override
  State<VideoProfilePage> createState() => _VideoProfilePageState();
}

class _VideoProfilePageState extends State<VideoProfilePage> {
  bool isExpanded = false;

  /// 视频信息
  Widget _buildVideoInfo() {
    return VideoInfo(widget.videoData);
  }

  /// 带图标的文本
  Widget _buildIconInfo(String icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(icon, width: 16.w, height: 16.h),
        1.horizontalSpace,
        Text(
          text,
          style: TextStyle(
              color: GlobalTheme.norGrayColor,
              fontSize: GlobalTheme.xxSmallFontSize),
        )
      ],
    );
  }

  /// 标题信息
  Widget _buildVideoTitle() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15).r,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                isExpanded = !isExpanded;
                setState(() {});
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: !isExpanded
                          ? Text(
                              widget.videoData.title!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: GlobalTheme.norTextColor,
                                  fontSize: GlobalTheme.smallFontSize),
                            )
                          : Text(
                              widget.videoData.title!,
                              style: TextStyle(
                                  color: GlobalTheme.norTextColor,
                                  fontSize: GlobalTheme.smallFontSize),
                            )),
                  isExpanded
                      ? Image.asset(GlobalIcons.icArrowUp,
                          width: 23.w, height: 23.h)
                      : Image.asset(GlobalIcons.icArrowDown,
                          width: 23.w, height: 23.h)
                ],
              ),
            ),
            10.verticalSpace,
            Row(
              children: [
                _buildIconInfo(GlobalIcons.playCustom02, '19.3万'),
                0.horizontalSpace,
                _buildIconInfo(GlobalIcons.remarkCustom02, '47'),
                4.horizontalSpace,
                Text(
                  '2022-11-17 21:02:00',
                  style: TextStyle(
                      color: GlobalTheme.norGrayColor,
                      fontSize: GlobalTheme.xxSmallFontSize),
                )
              ],
            )
          ],
        ));
  }

  /// 单个按钮
  Widget _buildPlayIconButton(String icon, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(icon, width: 27.w, height: 27.h),
        1.horizontalSpace,
        Text(
          text,
          style: TextStyle(
              color: GlobalTheme.norGrayColor,
              fontSize: GlobalTheme.xxSmallFontSize),
        )
      ],
    );
  }

  /// 渲染按钮
  Widget _buildButtonBanner() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildPlayIconButton("assets/image/icon/like_custom.png", '20'),
        _buildPlayIconButton("assets/image/icon/dislike_custom.png", "不喜欢"),
        _buildPlayIconButton("assets/image/icon/coin_custom.png", "30"),
        _buildPlayIconButton("assets/image/icon/collect_custom.png", "10000"),
        _buildPlayIconButton("assets/image/icon/share_custom.png", "300"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      child: Container(
        height: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(children: [
            _buildVideoInfo(),
            15.verticalSpace,
            _buildVideoTitle(),
            10.verticalSpace,
            _buildButtonBanner()
          ]),
        ),
      ),
    );
  }
}
