/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-09 13:57:07
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-10 16:54:56
 * @FilePath: /flutter_clone_bilibili/lib/page/home/anime/home_anime_page.dart
 * @Description: 动漫
 */
import 'package:card_swiper/card_swiper.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_bilibili/common/style/icons.dart';
import 'package:flutter_clone_bilibili/common/style/theme.dart';
import 'package:flutter_clone_bilibili/model/BangumiModel.dart';
import 'package:flutter_clone_bilibili/page/home/anime/anime_item.dart';
import 'package:flutter_clone_bilibili/page/home/anime/bangumi_rank_zone.dart';
import 'package:flutter_clone_bilibili/page/home/widgets/home_pagination.dart';
import 'package:flutter_clone_bilibili/provider/home_provider.dart';
import 'package:flutter_clone_bilibili/widgets/bili_classical_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeAnimePage extends StatefulWidget {
  const HomeAnimePage({super.key});

  @override
  State<HomeAnimePage> createState() => _HomeAnimePageState();
}

class _HomeAnimePageState extends State<HomeAnimePage>
    with SingleTickerProviderStateMixin {
  late ScrollController _easyRefreshScrollController;
  late ScrollController _customScrollController;
  late ScrollController _buttonsScrollController;
  late SwiperController _swiperController;
  @override
  void initState() {
    _customScrollController = ScrollController();
    _easyRefreshScrollController = ScrollController();
    _buttonsScrollController = ScrollController();
    _swiperController = SwiperController();
    if (mounted) {
      Provider.of<HomeProvider>(context, listen: false).initAnimeModuleList();
    }
    super.initState();
  }

  /// 渲染轮播图
  Widget _buildSwiper(List<Module> modules) {
    if (modules.isEmpty) {
      return const SizedBox();
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10).r,
      height: 180.h,
      child: Swiper(
        controller: _swiperController,
        itemCount: modules[0].items.length,
        autoplay: true,
        autoplayDelay: 3000,
        pagination: SwiperPagination(
          alignment: Alignment.bottomRight,
          builder: SwiperCustomPagination(builder: (context, config) {
            return HomePagination(
                currentIndex: config.activeIndex,
                itemCount: modules[0].items.length);
          }),
        ),
        itemBuilder: ((context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              image: DecorationImage(
                  image: NetworkImage(modules[0].items[index].cover!),
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.low),
            ),
          );
        }),
      ),
    );
  }

  /// 渲染功能列表
  Widget _buildFunctionBtn(List<Module> modules) {
    if (modules.isEmpty) {
      return const SizedBox();
    }
    return Container(
      height: 80.h,
      padding: const EdgeInsets.only(left: 10).r,
      alignment: Alignment.center,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: modules[1].items.length,
          itemBuilder: ((context, index) {
            return Padding(
                padding: const EdgeInsets.only(right: 20).r,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 35.r,
                      height: 35.r,
                      child: FadeInImage(
                          fit: BoxFit.fill,
                          placeholderFit: BoxFit.fill,
                          placeholder: const AssetImage(
                              GlobalIcons.videoPlaceHolderDefault),
                          image: NetworkImage(modules[1].items[index].cover!)),
                    ),
                    10.verticalSpace,
                    Text(
                      modules[1].items[index].title,
                      style: TextStyle(
                          color: GlobalTheme.norTextColor,
                          fontSize: GlobalTheme.xxxSmallFontSize),
                    )
                  ],
                ));
          })),
    );
  }

  /// 渲染grid列表
  Widget _buildGridView(List<Module> moduleList) {
    List<Item> items = [];
    for (var module in moduleList) {
      items.addAll(module.items);
    }
    if (items.isEmpty) {
      return const SizedBox();
    }
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10).r,
      child: CustomScrollView(
        controller: _customScrollController,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        slivers: [
          SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return AnimeItem(items[index]);
              }, childCount: items.length),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisExtent: 200.h, maxCrossAxisExtent: 180.w))
        ],
      ),
    );
  }

  getGridModules(List<Module> modules, int start, int end) {
    List<Module> items = [];
    items.addAll(modules.getRange(start, end));
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<HomeProvider>(builder: (context, vMdata, child) {
      return EasyRefresh(
        header: BiliClassicalHeader.header,
        onRefresh: () {},
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _buildSwiper(vMdata.animeModuleList),
            ),
            SliverToBoxAdapter(
              child: 10.verticalSpace,
            ),
            SliverToBoxAdapter(
              child: _buildFunctionBtn(vMdata.animeModuleList),
            ),
            SliverToBoxAdapter(
              child: 10.verticalSpace,
            ),
            SliverToBoxAdapter(
                child: _buildGridView(
                    getGridModules(vMdata.animeModuleList, 2, 3))),
            SliverToBoxAdapter(
              child: 20.verticalSpace,
            ),
            SliverToBoxAdapter(
                child: BangumiRankZone(
              modules: vMdata.animeModuleList,
              zoneNum: 7,
            )),
            SliverToBoxAdapter(
                child: _buildGridView(
                    getGridModules(vMdata.animeModuleList, 4, 7))),
            SliverToBoxAdapter(
              child: 20.verticalSpace,
            ),
            SliverToBoxAdapter(
                child: BangumiRankZone(
              modules: vMdata.animeModuleList,
              zoneNum: 7,
            ))
          ],
        ),
      );
    }));
  }
}
