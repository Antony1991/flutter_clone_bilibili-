/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-08 19:28:02
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-08 19:29:41
 * @FilePath: /flutter_clone_bilibili/lib/common/service/result_data.dart
 * @Description: 返回数据
 */
class ResultData {
  int code;
  String message;
  int ttl;
  var data;
  ResultData(
      {required this.code,
      required this.message,
      required this.ttl,
      required this.data});
}
