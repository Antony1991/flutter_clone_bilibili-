/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-07 23:33:12
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-07 23:33:36
 * @FilePath: /flutter_clone_bilibili/lib/page/dynamic/dynamic_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';

class DynamicPage extends StatefulWidget {
  const DynamicPage({super.key});

  @override
  State<DynamicPage> createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('动态')));
  }
}
