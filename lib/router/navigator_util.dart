/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-07 21:15:28
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-07 21:16:41
 * @FilePath: /flutter_clone_bilibili/lib/router/navigator_util.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';

class NavigatorUtil {
  static pushNamed(BuildContext context, String routeName) {
    return Navigator.pushNamed(context, routeName);
  }
}
