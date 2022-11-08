/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-08 09:58:35
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-08 10:44:23
 * @FilePath: /flutter_clone_bilibili/lib/widgets/bili_avatar.dart
 * @Description: 头像样式
 */
import 'package:flutter/material.dart';
import 'package:flutter_clone_bilibili/common/style/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BiliAvatar extends StatelessWidget {
  final String imgUrl;
  const BiliAvatar(this.imgUrl, {Key? key}) : super(key: key);

  Widget _buildEmpty(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).canvasColor,
      radius: 20.r,
      child: TextButton(
          onPressed: () {},
          child: Text(
            '登录',
            style: TextStyle(
                color: GlobalTheme.norMainThemeColors,
                fontSize: GlobalTheme.xxxSmallFontSize),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (imgUrl.isEmpty) {
      return _buildEmpty(context);
    }
    return GestureDetector(
      onTap: () {},
      child: CircleAvatar(backgroundImage: NetworkImage(imgUrl)),
    );
  }
}
