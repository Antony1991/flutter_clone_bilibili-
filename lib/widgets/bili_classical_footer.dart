/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-09 11:11:34
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-09 11:12:17
 * @FilePath: /flutter_clone_bilibili/lib/widgets/bili_classical_footer.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:easy_refresh/easy_refresh.dart';

class BiliClassicalFooter {
  static const footer = ClassicFooter(
      dragText: '上拉加载',
      processingText: '加载中...',
      readyText: '加载中...',
      processedText: '加载成功',
      messageText: '最后更新于 %T');
}
