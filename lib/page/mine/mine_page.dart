/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-07 23:35:00
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-07 23:35:18
 * @FilePath: /flutter_clone_bilibili/lib/page/mine/mine_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('我的')));
  }
}
