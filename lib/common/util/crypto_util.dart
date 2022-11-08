/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-08 18:22:50
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-08 18:59:03
 * @FilePath: /flutter_clone_bilibili/lib/common/util/crypto_util.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_clone_bilibili/common/constant/constant.dart';

class CryptoUtil {
  /// 获取参数的sign值
  static String getSign(Map<String, dynamic> query) {
    /// 按照key排序
    var sortKeys = query.keys.toList()..sort();
    Map<String, dynamic> sortMap = {};
    for (var element in sortKeys) {
      sortMap[element] = query[element];
    }

    /// 参数序列化
    String content = serializationParams(sortMap);

    /// 拼上appsec, 并且md5加密
    String sign = md5
        .convert(const Utf8Encoder().convert(content + Constant.appSec))
        .toString();
    return sign;
  }

  /// 参数序列化(拼接?和&)
  static String serializationParams(Map<String, dynamic> sortMap) {
    String content = "";
    sortMap.forEach((key, value) {
      /// encodeComponent 将string 转为url可识别的url
      content += ("$key=${Uri.encodeComponent(value)}&");
    });
    content = content.substring(0, content.length - 1);
    return content;
  }
}
