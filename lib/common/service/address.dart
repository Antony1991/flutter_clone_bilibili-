/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-08 15:34:39
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-09 15:05:17
 * @FilePath: /flutter_clone_bilibili/lib/common/service/address.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter_clone_bilibili/common/constant/constant.dart';

class Address {
  static const homeVideoUrl =
      "${Constant.baseUrl}/x/web-interface/dynamic/region";

  /// 首页推荐视频
  static const feedIndexDataUrl = "${Constant.baseAppUrl}/x/v2/feed/index";

  /// 首页动画列表
  static const animeDataUrl =
      "${Constant.baseUrl}/pgc/page/bangumi?build=6720300&mobi_app=android";
}
