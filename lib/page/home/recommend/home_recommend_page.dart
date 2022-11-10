/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-08 12:57:23
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-10 16:55:10
 * @FilePath: /flutter_clone_bilibili/lib/page/home/recommend/home_recommend_page.dart
 * @Description: 首页推荐
 */
import 'package:card_swiper/card_swiper.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_bilibili/common/style/icons.dart';
import 'package:flutter_clone_bilibili/common/style/theme.dart';
import 'package:flutter_clone_bilibili/model/FeedIndexModel.dart';
import 'package:flutter_clone_bilibili/page/home/widgets/home_video_item.dart';
import 'package:flutter_clone_bilibili/provider/home_provider.dart';
import 'package:flutter_clone_bilibili/widgets/bili_classical_footer.dart';
import 'package:flutter_clone_bilibili/widgets/bili_classical_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeRecommendPage extends StatefulWidget {
  const HomeRecommendPage({super.key});

  @override
  State<HomeRecommendPage> createState() => _HomeRecommendPageState();
}

class _HomeRecommendPageState extends State<HomeRecommendPage>
    with SingleTickerProviderStateMixin {
  List<Widget> recommendWidgets = [];
  @override
  void initState() {
    if (mounted) {
      Provider.of<HomeProvider>(context, listen: false).initVideoList();
    }
    super.initState();
  }

  /// 渲染视频列表
  Widget _buildVideoList(List<FeedIndexItem> feedIndexItemList) {
    return Expanded(
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: feedIndexItemList.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 180.w, mainAxisExtent: 205.h),
            itemBuilder: ((context, index) {
              return HomeVideoItem(feedIndexItemList[index]);
            })));
  }

  /// 渲染swiper 轮播图
  Widget _buildSwiper(List<BannerItem> bannerItems) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.r),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8).r,
        height: 200.h,
        child: Swiper(
          itemCount: bannerItems.length,
          autoplayDelay: 3000,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                FadeInImage(
                    fit: BoxFit.cover,
                    placeholderFit: BoxFit.cover,
                    placeholder:
                        const AssetImage(GlobalIcons.videoPlaceHolderDefault),
                    image:
                        NetworkImage(bannerItems[index].staticBanner!.image!)),
                Positioned(
                  left: 10.r,
                  right: 10.r,
                  child: Text(
                    bannerItems[index].staticBanner!.title!,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: GlobalTheme.xxSmallFontSize),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, feedIndexVM, child) {
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
      if (recommendWidgets.isEmpty) {
        if (feedIndexVM.feedIndexItemList.length == 10) {
          recommendWidgets.add(_buildVideoList(feedIndexVM.feedIndexItemList));
        } else if (feedIndexVM.feedIndexItemList.length == 11) {
          recommendWidgets.addAll([
            _buildSwiper(feedIndexVM.feedIndexItemList[0].bannerItems!),
            _buildVideoList(feedIndexVM.feedIndexItemList.sublist(1))
          ]);
        } else {
          print('null');
        }
      }
      return EasyRefresh(
          refreshOnStart: true,
          header: BiliClassicalHeader.header,
          footer: BiliClassicalFooter.footer,
          onRefresh: () {
            feedIndexVM.initVideoList();
          },
          onLoad: () {
            Future.delayed(const Duration(milliseconds: 500)).then((value) {
              feedIndexVM.loadVideoList();
            });
          },
          child: Padding(
              padding: const EdgeInsets.only(top: 4).r,
              child: Column(
                children: recommendWidgets,
              )));
    });
  }
}
