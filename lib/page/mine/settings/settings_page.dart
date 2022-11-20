/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-20 21:01:25
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-20 22:38:50
 * @FilePath: /flutter_clone_bilibili/lib/page/mine/settings/settings_page.dart
 * @Description: 设置页面
 */
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_bilibili/common/style/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final List<SettingItemModel> userList = [
    SettingItemModel('账号资料', 'xx'),
    SettingItemModel('账号资料', 'xx'),
  ];
  final List<SettingItemModel> videoList = [
    SettingItemModel('开屏画面设置', 'xx'),
    SettingItemModel('开屏画面设置', 'xx'),
    SettingItemModel('开屏画面设置', 'xx'),
    SettingItemModel('开屏画面设置', 'xx'),
    SettingItemModel('开屏画面设置', 'xx'),
  ];

  /// 渲染item
  Widget _buildItem(SettingItemModel itemModel, int index) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10).r,
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
                top: BorderSide.none,
                left: BorderSide.none,
                right: BorderSide.none,
                bottom:
                    BorderSide(color: GlobalTheme.norWhite04Color, width: 1))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Text(itemModel.text)),
            const Icon(Icons.chevron_right)
          ],
        ),
      ),
    );
  }

  ///渲染内容
  Widget _buildUser() {
    return SliverList(
        delegate: SliverChildBuilderDelegate(((context, index) {
      SettingItemModel item = userList[index];
      return _buildItem(item, index);
    }), childCount: userList.length));
  }

  ///渲染video设置
  Widget _buildVideo() {
    return SliverList(
        delegate: SliverChildBuilderDelegate(((context, index) {
      SettingItemModel item = videoList[index];
      return _buildItem(item, index);
    }), childCount: videoList.length));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0.3,
            title: Text(
              '设置',
              style: TextStyle(fontSize: GlobalTheme.smallFontSize),
            )),
        body: SizedBox(
          height: double.infinity,
          child: EasyRefresh(
              fit: StackFit.expand,
              child: CustomScrollView(
                slivers: [
                  _buildUser(),
                  SliverToBoxAdapter(
                    child: 20.verticalSpace,
                  ),
                  _buildVideo(),
                  SliverToBoxAdapter(
                    child: 20.verticalSpace,
                  ),
                  _buildVideo(),
                ],
              )),
        ));
  }
}

class SettingItemModel {
  /// label
  final String text;

  /// 跳转的路由
  final String routeName;
  SettingItemModel(this.text, this.routeName);
}
