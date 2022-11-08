/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-08 15:34:57
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-08 19:41:48
 * @FilePath: /flutter_clone_bilibili/lib/common/service/dio.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_clone_bilibili/common/constant/constant.dart';

class HttpManager {
  /// formdata
  static Map<String, dynamic> utf8Headers = {
    HttpHeaders.contentTypeHeader: 'multipart/form-data'
  };

  /// 请求json数据
  static Map<String, dynamic> jsonHeaders = {
    HttpHeaders.acceptHeader: 'application/json,*/*',
    HttpHeaders.contentTypeHeader: 'application/json',
  };

  /// 请求xml数据
  static Map<String, dynamic> xmlHeaders = {
    HttpHeaders.acceptHeader: 'application/xml,*/*',
    HttpHeaders.contentTypeHeader: 'application/xml;charset=UTF-8',
  };

  /// 请求protobuf数据
  static Map<String, dynamic> protoHeaders = {
    HttpHeaders.acceptHeader: '*/*',
    HttpHeaders.contentTypeHeader: 'application/x-protobuf',
  };

  /// 请求
  Future request(String url,
      {method, params, contentType, responseType}) async {
    /// 默认为GET请求
    method = method ?? 'GET';

    /// 请求json格式
    contentType = contentType ?? "JSON";

    /// 响应json数据
    responseType = responseType ?? ResponseType.json;

    /// 请求头
    Map<String, dynamic> httpHeaders;
    if (contentType == 'XML') {
      httpHeaders = xmlHeaders;
    } else if (contentType == 'PROTO') {
      /// 弹幕
      httpHeaders = protoHeaders;
    } else if (contentType == 'UTF-8') {
      /// 登录
      httpHeaders = utf8Headers;
    } else {
      httpHeaders = jsonHeaders;
    }

    BaseOptions baseOptions = BaseOptions(
        method: method,
        connectTimeout: Constant.connectTimeout,
        responseType: responseType,
        headers: httpHeaders);

    /// 初始化dio
    Dio dio = Dio(baseOptions);
    try {
      Response response;
      if (method == 'POST') {
        response = await dio.request(url, data: params);
      } else {
        response = await dio.request(url);
      }

      /// 打印请求基本信息
      if (Constant.isDebug) {
        print("URL：$url");
        print("请求方式：${dio.options.method}");
        print("请求头：");
        dio.options.headers.forEach((key, value) {
          print("$key : $value");
        });
        print("响应类型：${dio.options.responseType}");
        if (method == "POST") {
          print("参数为$params");
        }
      }

      /// 返回数据
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}

final HttpManager httpManager = HttpManager();
