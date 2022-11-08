/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-07 21:11:01
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-07 23:37:09
 * @FilePath: /flutter_clone_bilibili/lib/page/index/index_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_clone_bilibili/common/style/icons.dart';
import 'package:flutter_clone_bilibili/common/style/theme.dart';
import 'package:flutter_clone_bilibili/page/dynamic/dynamic_page.dart';
import 'package:flutter_clone_bilibili/page/home/home_page.dart';
import 'package:flutter_clone_bilibili/page/mine/mine_page.dart';
import 'package:flutter_clone_bilibili/page/vip/vip_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> with IndexPageBLoC {
  BottomNavigationBarItem _buildBarItem(
      String title, String iconName, String activeIconName) {
    return BottomNavigationBarItem(
        label: title,
        icon: Image.asset(
          iconName, width: 18.sp, height: 18.sp,
          gaplessPlayback: true, // 原图片保存不变，加载完显示替换图片，不会闪烁
        ),
        activeIcon: Image.asset(activeIconName,
            width: 18.sp, height: 18.sp, gaplessPlayback: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: const [HomePage(), DynamicPage(), VipPage(), MinePage()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: bottomNavTap,
          items: [
            _buildBarItem(
                '首页', GlobalIcons.homeTabBar, GlobalIcons.homeTabBarSelected),
            _buildBarItem('动态', GlobalIcons.dynamicTabBar,
                GlobalIcons.dynamicTabBarSelected),
            _buildBarItem(
                '会员购', GlobalIcons.vipTabBar, GlobalIcons.vipTabBarSelected),
            _buildBarItem(
                '我的', GlobalIcons.mineTabBar, GlobalIcons.mineTabBarSelected)
          ],

          /// 选中时字体大小
          selectedFontSize: GlobalTheme.xxSmallFontSize,
          unselectedFontSize: GlobalTheme.xxSmallFontSize,
          selectedItemColor: GlobalTheme.norMainThemeColors,
          type: BottomNavigationBarType.fixed,
        ));
  }
}

mixin IndexPageBLoC on State<IndexPage> {
  int _currentIndex = 0;

  void bottomNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
