/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-07 20:40:06
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-20 21:26:11
 * @FilePath: /flutter_clone_bilibili/lib/app.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_clone_bilibili/common/style/theme.dart';
import 'package:flutter_clone_bilibili/provider/home_provider.dart';
import 'package:flutter_clone_bilibili/provider/player_provider.dart';
import 'package:flutter_clone_bilibili/router/home_router.dart';
import 'package:flutter_clone_bilibili/router/mine_router.dart';
import 'package:flutter_clone_bilibili/router/user_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BilibiliApp extends StatefulWidget {
  const BilibiliApp({super.key});

  @override
  State<BilibiliApp> createState() => _BilibiliAppState();
}

class _BilibiliAppState extends State<BilibiliApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeProvider()),
          ChangeNotifierProvider(create: (context) => PlayerProvider.init()),
        ],
        child: ScreenUtilInit(
            minTextAdapt: true,
            splitScreenMode: true,
            designSize: const Size(360, 690),
            builder: (context, child) {
              return MaterialApp(
                  theme: ThemeData(
                      appBarTheme: const AppBarTheme(
                          iconTheme:
                              IconThemeData(color: GlobalTheme.norGrayColor),
                          titleTextStyle:
                              TextStyle(color: GlobalTheme.norTextColor),
                          // backgroundColor: Colors.white,
                          color: Colors.white)),
                  // initialRoute: HomeRouters.splash,
                  routes: HomeRouters.getRoutes(context)
                    ..addAll(UserRouters.getRoutes(context))
                    ..addAll(MineRouters.getRoutes(context)));
            }));
  }
}
