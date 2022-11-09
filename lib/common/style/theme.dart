/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-07 22:58:00
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-09 22:50:28
 * @FilePath: /flutter_clone_bilibili/lib/common/style/theme.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalTheme {
  /// 字体大小
  static double xxSmallFontSize = 12.sp;
  static double xxxSmallFontSize = 10.sp;
  static double xSmallFontSize = 14.sp;
  static double smallFontSize = 16.sp;
  static double normalFontSize = 20.sp;
  static double largeFontSize = 22.sp;
  static double xLargeFontSize = 24.sp;
  static double xxLargeFontSize = 26.sp;
  static double xxxLargeFontSize = 28.sp;
  static double hugeFontSize = 32.sp;
  static double xHugeFontSize = 34.sp;
  static double xxHugeFontSize = 36.sp;
  static double xxxHugeFontSize = 38.sp;

  /// 普通模式
  /// 白色
  static const Color norTextColor = Colors.black;
  static const Color norWhite02Color = Color.fromRGBO(246, 247, 249, 1);
  static const Color norWhite03Color = Color.fromRGBO(255, 236, 240, 1);
  static const Color norWhite04Color = Color.fromRGBO(242, 243, 245, 1);
  static const Color norWhite05Color = Color.fromRGBO(254, 244, 234, 1);

  ///灰色
  static const Color norGrayColor = Color.fromRGBO(149, 149, 149, 1);
  static const Color norGray02Color = Color.fromRGBO(100, 101, 103, 1);
  static const Color norGray03Color = Color.fromRGBO(95, 103, 106, 1);
  static const Color norGray04Color = Color.fromRGBO(77, 77, 77, 1);
  static const Color norGray05Color = Color.fromRGBO(156, 156, 158, 1);
  static const Color unselectedLabelColor = Color.fromRGBO(95, 95, 95, 1);

  /// 粉色(主题色)
  static const Color norMainThemeColors = Color.fromRGBO(253, 105, 155, 1);
  static const Color norPink02Colors = Color.fromRGBO(255, 154, 184, 1);
  static const Color norPink03Colors = Color.fromRGBO(133, 61, 83, 1);
  static const Color norPink04Colors = Color.fromRGBO(255, 102, 156, 1);
  static const Color norPink05Colors = Color.fromRGBO(177, 143, 157, 1);
  static const Color norPink06Colors = Color.fromRGBO(236, 114, 153, 1);
  static const Color norPink07Colors = Color.fromRGBO(226, 134, 159, 1);
  static const Color norPink08Colors = Color.fromRGBO(217, 121, 151, 1);

  static Color hexColor(String webColor) {
    /// 将 #dc380d 值转换为 -> dc380d
    String colorString = webColor.substring(1);
    return Color(int.parse(colorString, radix: 16)).withAlpha(255);
  }
}
