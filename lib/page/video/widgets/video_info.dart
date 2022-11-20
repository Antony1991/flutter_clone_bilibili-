/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-17 21:53:26
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-20 16:20:57
 * @FilePath: /flutter_clone_bilibili/lib/page/video/widgets/video_info.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_clone_bilibili/common/style/theme.dart';
import 'package:flutter_clone_bilibili/model/FeedIndexModel.dart';
import 'package:flutter_clone_bilibili/widgets/bili_avatar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoInfo extends StatelessWidget {
  final FeedIndexItem videoModel;
  const VideoInfo(this.videoModel, {Key? key}) : super(key: key);

  /// 个人信息
  Widget _buildOwnerInfo() {
    return Row(
      children: [
        BiliAvatar(videoModel.cover!),
        Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '柯南',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: GlobalTheme.norMainThemeColors),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("20万粉丝",
                          style: TextStyle(
                              color: GlobalTheme.norGrayColor,
                              fontSize: GlobalTheme.xxxSmallFontSize)),
                      10.horizontalSpace,
                      Text(
                        '100视频',
                        style: TextStyle(
                            color: GlobalTheme.norGrayColor,
                            fontSize: GlobalTheme.xxxSmallFontSize),
                      )
                    ],
                  )
                ],
              ),
            )),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 13).r,
              backgroundColor: GlobalTheme.norMainThemeColors,
              textStyle: TextStyle(fontSize: GlobalTheme.xxSmallFontSize)),
          child: const Text('+ 关注'),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15).r,
      child: Column(
        children: [
          _buildOwnerInfo(),
        ],
      ),
    );
  }
}
