/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-07 20:49:58
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-07 21:06:03
 * @FilePath: /flutter_clone_bilibili/lib/router/user_router.dart
 * @Description: 用户相关路由
 */
import 'package:flutter/material.dart';
import 'package:flutter_clone_bilibili/page/auth/auth_signin_page.dart';

class UserRouters {
  /// 登录
  static String authSignin = '/auth/signin';

  /// 注册
  static String authRegister = '/auth/register';

  static Map<String, WidgetBuilder> getRoutes(BuildContext context) {
    return {authSignin: ((context) => const AuthSigninPage())};
  }
}
