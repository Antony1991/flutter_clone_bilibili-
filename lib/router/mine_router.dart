/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-07 20:49:58
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-20 21:07:46
 * @FilePath: /flutter_clone_bilibili/lib/router/user_router.dart
 * @Description: 用户相关路由
 */
import 'package:flutter/material.dart';
import 'package:flutter_clone_bilibili/page/mine/settings/settings_page.dart';

class MineRouters {
  /// 设置页
  static String settings = '/mine/settings';

  static Map<String, WidgetBuilder> getRoutes(BuildContext context) {
    return {
      settings: (context) => const SettingsPage(),
    };
  }
}
