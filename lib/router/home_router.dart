/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-07 20:49:58
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-13 21:45:33
 * @FilePath: /flutter_clone_bilibili/lib/router/user_router.dart
 * @Description: 用户相关路由
 */
import 'package:flutter/material.dart';
import 'package:flutter_clone_bilibili/page/index/index_page.dart';
import 'package:flutter_clone_bilibili/page/video/video_play_page.dart';

class HomeRouters {
  /// 启动页
  static String splash = '/';

  /// 首页
  static String home = '/home';

  static Map<String, WidgetBuilder> getRoutes(BuildContext context) {
    return {
      splash: (context) => const VideoPlayPage(),
      home: (context) => const IndexPage()
    };
  }
}
