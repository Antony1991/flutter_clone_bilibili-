/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-07 23:21:22
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-09 15:16:13
 * @FilePath: /flutter_clone_bilibili/lib/page/home/home_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_clone_bilibili/common/style/icons.dart';
import 'package:flutter_clone_bilibili/common/style/theme.dart';
import 'package:flutter_clone_bilibili/page/home/anime/home_anime_page.dart';
import 'package:flutter_clone_bilibili/page/home/recommend/home_recommend_page.dart';
import 'package:flutter_clone_bilibili/widgets/bili_avatar.dart';
import 'package:flutter_clone_bilibili/widgets/bili_icon_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// 渲染内容
  Widget _buildTabbarView() {
    return TabBarView(children: buildTabbarViewChildren());
  }

  /// 渲染多个tab
  List<Widget> buildTabbarViewChildren() {
    return [
      const Text('11'),
      const HomeRecommendPage(),
      const HomeAnimePage(),
      const Text('11'),
      const Text('11')
    ];
  }

  /// 头部搜索
  Widget _buildSearch() {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10, right: 20).r,
          child: const BiliAvatar(''),
        ),
        Expanded(
            child: GestureDetector(
                child: Container(
          alignment: Alignment.centerLeft,
          height: 35.h,
          decoration: BoxDecoration(
              color: GlobalTheme.norWhite02Color,
              borderRadius: BorderRadius.circular(20.r)),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 8, bottom: 8).r,
            child: Image.asset(GlobalIcons.homeSearch),
          ),
        )))
      ],
    );
  }

  /// 头部搜索工具
  List<Widget> _buildSearchActions() {
    return [
      BiliIconButton(GlobalIcons.homeGameCustom, onPressed: () {}),
      1.horizontalSpace,
      BiliIconButton(GlobalIcons.homeMailCustom, onPressed: () {})
    ];
  }

  /// 渲染tabbar
  TabBar _buildTabbar() {
    return TabBar(
      tabs: const [
        Tab(text: '直播'),
        Tab(text: '推荐'),
        Tab(text: '动画'),
        Tab(text: '影视'),
        Tab(text: '共同防疫'),
      ],
      // isScrollable: true,

      /// 下划线高度
      indicatorWeight: 3.h,
      indicatorColor: GlobalTheme.norMainThemeColors,
      labelColor: GlobalTheme.norMainThemeColors,
      indicatorSize: TabBarIndicatorSize.label,
      unselectedLabelColor: GlobalTheme.unselectedLabelColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: DefaultTabController(
                initialIndex: 1,
                length: 5,
                child: NestedScrollView(
                    headerSliverBuilder: (context, innerBoxIsScrolled) {
                      return [
                        SliverAppBar(
                          toolbarHeight: 0.08.sh,
                          leading: null,
                          leadingWidth: 0,
                          title: _buildSearch(),
                          backgroundColor: Colors.white,
                          actions: _buildSearchActions(),
                          titleSpacing: 0,
                        ),
                        SliverAppBar(
                          toolbarHeight: 0.07.sh,
                          leading: null,
                          leadingWidth: 0,
                          snap: true,
                          floating: true,
                          pinned: true,
                          title: _buildTabbar(),
                          backgroundColor: Colors.white,
                          titleSpacing: 0,
                        ),
                      ];
                    },
                    body: _buildTabbarView()))));
  }
}
