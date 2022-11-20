/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-07 23:35:00
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-20 21:08:48
 * @FilePath: /flutter_clone_bilibili/lib/page/mine/mine_page.dart
 * @Description: 我的页面
 */

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_bilibili/common/style/icons.dart';
import 'package:flutter_clone_bilibili/common/style/theme.dart';
import 'package:flutter_clone_bilibili/router/mine_router.dart';
import 'package:flutter_clone_bilibili/router/navigator_util.dart';
import 'package:flutter_clone_bilibili/widgets/bili_avatar.dart';
import 'package:flutter_clone_bilibili/widgets/bili_classical_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  final double iconSize = 17.sp;
  final List<MineImgTextModel> historyGroupList = [
    const MineImgTextModel(GlobalIcons.mineOfflineCache, '离线缓存'),
    const MineImgTextModel(GlobalIcons.mineHistory, '历史记录'),
    const MineImgTextModel(GlobalIcons.mineFavor, '我的收藏'),
    const MineImgTextModel(GlobalIcons.mineWatch, '稍后再看')
  ];
  final List<MineImgTextModel> recommedList = [
    const MineImgTextModel(GlobalIcons.mineMyClass, '我的课程'),
    const MineImgTextModel(GlobalIcons.mineFreeFlow, '免流量服务'),
    const MineImgTextModel(GlobalIcons.mineClothes, '个性装扮'),
    const MineImgTextModel(GlobalIcons.mineMyWalt, '我的钱包'),
    const MineImgTextModel(GlobalIcons.mineMyVip, '会员购中心'),
    const MineImgTextModel(GlobalIcons.mineAward, '推荐有奖'),
    const MineImgTextModel(GlobalIcons.mineTalkCenter, '社区中心'),
    const MineImgTextModel(GlobalIcons.mineBenefit, '哔哩哔哩公益'),
    const MineImgTextModel(GlobalIcons.mineEletric, '充能领福利'),
    const MineImgTextModel(GlobalIcons.mineGas, '能量加油站'),
    const MineImgTextModel(GlobalIcons.mineRedPack, '邀好友赚红包'),
    const MineImgTextModel(GlobalIcons.mineGameCenter, '游戏中心')
  ];

  /// 用户信息
  Widget _buildUser() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10).r,
        child: Row(
          children: [
            const BiliAvatar(GlobalIcons.videoPlaceHolderDefault),
            10.horizontalSpace,
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('月下笙',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: GlobalTheme.norTextColor,
                    )),
                Text(
                  'B币：0.0 硬币：0',
                  style: TextStyle(
                      color: GlobalTheme.norGrayColor,
                      fontSize: GlobalTheme.xxxSmallFontSize),
                )
              ],
            )),
            Image.asset(GlobalIcons.mineStaffMore)
          ],
        ));
  }

  /// 渲染粉丝列
  Widget _buildFans() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10).r,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  '72',
                  style: TextStyle(
                      color: GlobalTheme.norTextColor,
                      fontSize: GlobalTheme.xSmallFontSize),
                ),
                5.verticalSpace,
                Text(
                  '动态',
                  style: TextStyle(
                      color: GlobalTheme.norGrayColor,
                      fontSize: GlobalTheme.xSmallFontSize),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  '398',
                  style: TextStyle(
                      color: GlobalTheme.norTextColor,
                      fontSize: GlobalTheme.xSmallFontSize),
                ),
                5.verticalSpace,
                Text(
                  '关注',
                  style: TextStyle(
                      color: GlobalTheme.norGrayColor,
                      fontSize: GlobalTheme.xSmallFontSize),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  '18',
                  style: TextStyle(
                      color: GlobalTheme.norTextColor,
                      fontSize: GlobalTheme.xSmallFontSize),
                ),
                5.verticalSpace,
                Text(
                  '粉丝',
                  style: TextStyle(
                      color: GlobalTheme.norGrayColor,
                      fontSize: GlobalTheme.xSmallFontSize),
                )
              ],
            )
          ],
        ));
  }

  /// appbar
  AppBar _buildAppBar() {
    return AppBar(
      leading: const SizedBox(),
      leadingWidth: 0,
      elevation: 0,
      backgroundColor: GlobalTheme.norWhite02Color,
      title: null,
      actions: [
        IconButton(
            splashRadius: iconSize,
            onPressed: () {},
            icon: Image.asset(
              GlobalIcons.mineConnect,
              width: iconSize,
              height: iconSize,
              color: GlobalTheme.norGrayColor,
            )),
        IconButton(
            splashRadius: iconSize,
            onPressed: () {},
            icon: Image.asset(
              GlobalIcons.mineScan,
              width: iconSize,
              height: iconSize,
              color: GlobalTheme.norGrayColor,
            )),
        IconButton(
            splashRadius: iconSize,
            onPressed: () {},
            icon: Image.asset(
              GlobalIcons.mineDarkModel,
              width: iconSize,
              height: iconSize,
              color: GlobalTheme.norGrayColor,
            )),
      ],
    );
  }

  /// 带文字的图片
  Widget _buildImgText(String icon, String text) {
    return Column(
      children: [
        Image.asset(icon, width: 24.sp, height: 24.sp),
        4.verticalSpace,
        Text(text,
            style: TextStyle(
                color: GlobalTheme.norGrayColor,
                fontSize: GlobalTheme.xxSmallFontSize))
      ],
    );
  }

  /// 标题
  Widget _buildSubTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20).r,
      child: Text(text,
          style: TextStyle(
              color: GlobalTheme.norTextColor,
              fontSize: GlobalTheme.smallFontSize)),
    );
  }

  /// 更多服务
  Widget _buildCommendMore() {
    return Column(
      children: [
        _buildCommendItem(GlobalIcons.mineCustom, '联系客服'),
        _buildCommendItem(GlobalIcons.mineTeensMode, '青少年守护'),
        _buildCommendItem(GlobalIcons.mineSettings, '设置', () {
          NavigatorUtil.pushNamed(context, MineRouters.settings);
        }),
      ],
    );
  }

  Widget _buildCommendItem(String iconName, String title,
      [VoidCallback? onTap]) {
    return ListTile(
      leading: Image.asset(
        iconName,
        width: 24.w,
        height: 24.h,
      ),
      onTap: onTap,
      title:
          Text(title, style: const TextStyle(color: GlobalTheme.norTextColor)),
      trailing: const Icon(Icons.chevron_right),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: _buildAppBar(),
      body: EasyRefresh(
          header: BiliClassicalHeader.header,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: _buildUser(),
              ),
              SliverToBoxAdapter(
                child: _buildFans(),
              ),
              SliverToBoxAdapter(
                child: 15.verticalSpace,
              ),
              SliverGrid(
                  delegate: SliverChildBuilderDelegate(((context, index) {
                    MineImgTextModel textModel = historyGroupList[index];
                    return _buildImgText(textModel.iconImg, textModel.text);
                  }), childCount: historyGroupList.length),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 42.h,
                      crossAxisCount: historyGroupList.length)),
              SliverToBoxAdapter(
                child: _buildSubTitle('推荐服务'),
              ),
              SliverGrid(
                  delegate: SliverChildBuilderDelegate(((context, index) {
                    MineImgTextModel textModel = recommedList[index];
                    return _buildImgText(textModel.iconImg, textModel.text);
                  }), childCount: recommedList.length),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 42.h,
                      crossAxisCount: 4,
                      mainAxisSpacing: 20.sp,
                      crossAxisSpacing: 4.sp)),
              SliverToBoxAdapter(
                child: _buildSubTitle('更多服务'),
              ),
              SliverToBoxAdapter(
                child: _buildCommendMore(),
              )
            ],
          )),
    ));
  }
}

class MineImgTextModel {
  final String iconImg;
  final String text;
  const MineImgTextModel(this.iconImg, this.text);
}
