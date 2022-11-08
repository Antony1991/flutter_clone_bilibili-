/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-08 12:57:23
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-08 21:52:09
 * @FilePath: /flutter_clone_bilibili/lib/page/home/recommend/home_recommend_page.dart
 * @Description: 首页推荐
 */
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_bilibili/page/home/widgets/home_video_item.dart';
import 'package:flutter_clone_bilibili/provider/home_recommend_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeRecommendPage extends StatefulWidget {
  const HomeRecommendPage({super.key});

  @override
  State<HomeRecommendPage> createState() => _HomeRecommendPageState();
}

class _HomeRecommendPageState extends State<HomeRecommendPage> {
  @override
  void initState() {
    // Provider.of<HomeRecommendProvider>(context).initVideoList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeRecommendProvider>(
        builder: (context, feedIndexVM, child) {
      // if (feedIndexVM.feedIndexItemList.isEmpty) {
      //   print("------empty");
      //   return Center(
      //     child: Column(
      //       mainAxisSize: MainAxisSize.min,
      //       children: [
      //         Image.asset(GlobalIcons.holderLoading,
      //             width: 150.r, height: 150.r),
      //         10.verticalSpace,
      //         TextButton(
      //             style: ButtonStyle(
      //                 backgroundColor: MaterialStateProperty.all(
      //                     GlobalTheme.norMainThemeColors)),
      //             onPressed: () {},
      //             child: Text(
      //               '刷新一下',
      //               style: TextStyle(
      //                   color: Colors.white,
      //                   fontSize: GlobalTheme.xxSmallFontSize),
      //             ))
      //       ],
      //     ),
      //   );
      // }
      return EasyRefresh(
          refreshOnStart: true,
          onRefresh: () {
            feedIndexVM.initVideoList();
          },
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: feedIndexVM.feedIndexItemList.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 180.w, mainAxisExtent: 205.h),
              itemBuilder: ((context, index) {
                return Padding(
                    padding: const EdgeInsets.only(
                            left: 6, right: 6, top: 4, bottom: 0)
                        .r,
                    child: HomeVideoItem(feedIndexVM.feedIndexItemList[index]));
              })));
    });
  }
}
