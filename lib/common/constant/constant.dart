/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-08 16:37:25
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-08 17:20:06
 * @FilePath: /flutter_clone_bilibili/lib/common/constant/constant.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/foundation.dart';

class Constant {
  /// live:直播界面
  /// base:网页端（待改）
  /// video:视频（获取原视频地址）
  /// app:app端的接口
  /// search:搜索用到的接口
  /// login:登录时需要用到的接口
  static const baseLiveUrl = "https://api.live.bilibili.com";
  static const baseUrl = "http://api.bilibili.com";
  static const baseVideoUrl = "https://m.bilibili.com";
  static const baseAppUrl = "http://app.bilibili.com";
  static const baseSearchUrl = "http://s.search.bilibili.com";
  static const baseLoginUrl = "https://passport.bilibili.com";
  static const baseMallUrl = "https://mall.bilibili.com";

  /// 是否为debug模式
  static const bool isDebug = kDebugMode;

  /// 接口超时
  static const int connectTimeout = 10000;

  ///app key
  static const String appKey = '1d8b6e7d45233436';

  ///app key对应的hash值
  static const String appSec = '560c52ccd288fed045859ed18bffd973';

  ///极光推送AppKey
  static const String jPushAppKey = "70eddda66db85cc65c0ba7f2";
}
