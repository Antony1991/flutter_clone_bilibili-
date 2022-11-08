/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-07 21:10:09
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-07 21:48:37
 * @FilePath: /flutter_clone_bilibili/lib/page/splash/splash_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_clone_bilibili/common/style/icons.dart';
import 'package:flutter_clone_bilibili/router/home_router.dart';
import 'package:flutter_clone_bilibili/router/navigator_util.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      NavigatorUtil.pushNamed(context, HomeRouters.home);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Image.asset(GlobalIcons.splash));
  }
}
