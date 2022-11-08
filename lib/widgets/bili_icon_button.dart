/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-08 10:49:15
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-08 11:00:48
 * @FilePath: /flutter_clone_bilibili/lib/widgets/bili_icon_button.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_clone_bilibili/common/style/theme.dart';

class BiliIconButton extends StatelessWidget {
  final String iconName;
  final double? width;
  final double? height;
  final void Function()? onPressed;
  const BiliIconButton(this.iconName,
      {Key? key, required this.onPressed, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(iconName,
          width: width ?? GlobalTheme.normalFontSize,
          height: height ?? GlobalTheme.normalFontSize),
      onPressed: onPressed,
    );
  }
}
