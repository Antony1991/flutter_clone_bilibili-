/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-07 21:04:36
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-07 21:05:16
 * @FilePath: /flutter_clone_bilibili/lib/page/auth/auth_signin_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';

class AuthSigninPage extends StatefulWidget {
  const AuthSigninPage({super.key});

  @override
  State<AuthSigninPage> createState() => _AuthSigninPageState();
}

class _AuthSigninPageState extends State<AuthSigninPage> {
  @override
  Widget build(BuildContext context) {
    return Container(child: const Text('登录'));
  }
}
