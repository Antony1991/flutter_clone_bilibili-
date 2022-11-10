/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-10 09:26:54
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-10 16:54:39
 * @FilePath: /flutter_clone_bilibili/lib/page/home/anime/bangumi_rank_zone.dart
 * @Description: 热门番剧区，热门国创区
 */

import 'package:flutter/material.dart';
import 'package:flutter_clone_bilibili/common/style/theme.dart';
import 'package:flutter_clone_bilibili/model/BangumiModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BangumiRankZone extends StatelessWidget {
  final List<Module> modules;
  final int zoneNum;
  const BangumiRankZone(
      {Key? key, required this.modules, required this.zoneNum})
      : super(key: key);

  /// 渲染标题
  Widget _buildTitle() {
    return Container(
      padding: const EdgeInsets.all(10).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(modules[zoneNum].title!,
                  style: TextStyle(
                      fontSize: GlobalTheme.normalFontSize,
                      color: GlobalTheme.norTextColor)),
              Text(
                "${modules[zoneNum].headers![0].title}>",
                style: TextStyle(
                    color: GlobalTheme.norTextColor,
                    fontSize: GlobalTheme.xxSmallFontSize),
              )
            ],
          ),
          Text(
            modules[zoneNum].desc!,
            style: TextStyle(
                color: GlobalTheme.norGrayColor,
                fontSize: GlobalTheme.xxSmallFontSize),
          )
        ],
      ),
    );
  }

  /// 渲染list
  Widget _buildList() {
    ///番剧排名排名1,2,3...的背景颜色
    final List<Color> rankColor = [
      const Color.fromRGBO(252, 176, 38, 1),
      const Color.fromRGBO(147, 176, 219, 1),
      const Color.fromRGBO(236, 158, 145, 1),
      const Color.fromRGBO(122, 134, 150, .9),
      const Color.fromRGBO(122, 134, 150, .8),
      const Color.fromRGBO(122, 134, 150, .7),
      const Color.fromRGBO(122, 134, 150, .6),
      const Color.fromRGBO(122, 134, 150, .5),
      const Color.fromRGBO(122, 134, 150, .5),
      const Color.fromRGBO(122, 134, 150, .5),
      const Color.fromRGBO(252, 176, 38, 1),
      const Color.fromRGBO(147, 176, 219, 1),
      const Color.fromRGBO(236, 158, 145, 1),
      const Color.fromRGBO(122, 134, 150, .9),
      const Color.fromRGBO(122, 134, 150, .8),
      const Color.fromRGBO(122, 134, 150, .7),
      const Color.fromRGBO(122, 134, 150, .6),
      const Color.fromRGBO(122, 134, 150, .5),
      const Color.fromRGBO(122, 134, 150, .5),
      const Color.fromRGBO(122, 134, 150, .5),
    ];
    return SizedBox(
      height: 200.h,
      child: ListView.builder(
          itemCount: modules[zoneNum].items.length,
          scrollDirection: Axis.horizontal,
          // physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.only(top: 10, right: 5).r,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 105.w,
                        height: 140.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.low,
                                image: NetworkImage(
                                    modules[zoneNum].items[index].cover!))),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5).r,
                          decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(10.r),
                              color: rankColor[index]),
                          child: Text((index + 1).toString()),
                        ),
                      ),
                      Positioned(
                        bottom: 5.h,
                        right: 5.w,
                        child: Text(
                            modules[zoneNum]
                                .items[index]
                                .bottomRightBadge!
                                .text,
                            style: TextStyle(
                                color: GlobalTheme.norWhite02Color,
                                fontSize: GlobalTheme.xxxSmallFontSize)),
                      )
                    ],
                  ),
                  Container(
                    width: 105.w,
                    margin: const EdgeInsets.only(top: 5).r,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      modules[zoneNum].items[index].title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: GlobalTheme.norTextColor,
                          fontSize: GlobalTheme.xxSmallFontSize),
                    ),
                  ),
                  Container(
                    width: 105.w,
                    margin: const EdgeInsets.only(top: 5).r,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      modules[zoneNum].items[index].desc!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: GlobalTheme.norGrayColor,
                          fontSize: GlobalTheme.xxSmallFontSize),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (modules.isEmpty) {
      return const SizedBox();
    }
    return Container(
      height: 270.h,
      // width: 1.sw,
      margin: const EdgeInsets.symmetric(horizontal: 10).r,
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(10).r,
      //     color: GlobalTheme.norPink08Colors,
      //     image: DecorationImage(
      //         opacity: .3,
      //         image: NetworkImage(modules[zoneNum].cover!),
      //         fit: BoxFit.fill)),
      child: Card(
          child: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10).r,
                  color: GlobalTheme.norWhite02Color,
                  image: DecorationImage(
                      opacity: .3,
                      image: NetworkImage(modules[zoneNum].cover!),
                      fit: BoxFit.fill))),
          Column(
            children: [_buildTitle(), _buildList()],
          )
        ],
      )),
    );
  }
}
