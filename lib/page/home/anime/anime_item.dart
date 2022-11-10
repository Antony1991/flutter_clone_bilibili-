/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-09 18:18:19
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-10 09:17:24
 * @FilePath: /flutter_clone_bilibili/lib/page/home/anime/anime_item.dart
 * @Description: 动画gridItem
 */
import 'package:flutter/material.dart';
import 'package:flutter_clone_bilibili/common/style/icons.dart';
import 'package:flutter_clone_bilibili/common/style/theme.dart';
import 'package:flutter_clone_bilibili/model/BangumiModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimeItem extends StatefulWidget {
  final Item animeItem;
  const AnimeItem(this.animeItem, {Key? key}) : super(key: key);

  @override
  State<AnimeItem> createState() => _AnimeItemState();
}

class _AnimeItemState extends State<AnimeItem> {
  /// 渲染封面图片
  Widget _buildCoverImg() {
    return SizedBox(
      height: 110.h,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(5.r),
          child: FadeInImage(
              fit: BoxFit.fill,
              placeholderFit: BoxFit.fill,
              placeholder:
                  const AssetImage(GlobalIcons.videoPlaceHolderDefault),
              image: NetworkImage(widget.animeItem.cover!))),
    );
  }

  /// 渲染类型和集数
  Widget _buildCoverType() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(widget.animeItem.bottomLeftBadge!.text,
            style: TextStyle(
              color: GlobalTheme.norWhite02Color,
              fontSize: GlobalTheme.xxxSmallFontSize,
            )),
        Text(widget.animeItem.stat!.followView,
            style: TextStyle(
                color: GlobalTheme.norWhite02Color,
                fontSize: GlobalTheme.xxxSmallFontSize))
      ],
    );
  }

  /// 渲染下面遮罩
  Widget _buildCoverMask() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 20.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          GlobalTheme.norTextColor.withOpacity(.7),
          Colors.transparent
        ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        padding: const EdgeInsets.symmetric(horizontal: 8).r,
        child: _buildCoverType(),
      ),
    );
  }

  /// 渲染上面遮罩
  Widget _buildCoverTopMask() {
    if (widget.animeItem.badgeInfo != null) {
      return Positioned(
          top: 10.h,
          right: 0.h,
          child: Container(
            decoration: BoxDecoration(
                color:
                    GlobalTheme.hexColor(widget.animeItem.badgeInfo!.bgColor!),
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(8.r))),
            padding: const EdgeInsets.fromLTRB(5, 2, 3, 2).r,
            child: Text(widget.animeItem.badgeInfo!.text!,
                style: TextStyle(
                    color: GlobalTheme.norWhite02Color,
                    fontSize: GlobalTheme.xxxSmallFontSize)),
          ));
    }
    return const SizedBox();
  }

  /// 渲染封面
  Widget _buildCover() {
    return Stack(
      children: [_buildCoverImg(), _buildCoverMask(), _buildCoverTopMask()],
    );
  }

  /// 渲染标题
  Widget _buildTitle() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2).r,
      alignment: Alignment.centerLeft,
      child: Text(
        widget.animeItem.title,
        style: TextStyle(
            color: GlobalTheme.norTextColor,
            fontSize: GlobalTheme.xxSmallFontSize),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  /// 渲染评分
  Widget _buildScoreFooter() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2).r,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4).r,
              decoration: BoxDecoration(
                  color: GlobalTheme.norWhite05Color,
                  borderRadius: BorderRadius.circular(2).r),
              child: Text(
                widget.animeItem.subTitleLeftBadge == null
                    ? '0.0'
                    : widget.animeItem.subTitleLeftBadge!.text,
                style: TextStyle(
                    color: const Color.fromRGBO(241, 129, 56, 1),
                    fontSize: GlobalTheme.xxSmallFontSize),
              ),
            ),
            5.horizontalSpace,
            Text(
              widget.animeItem.desc!,
              style: TextStyle(
                  color: GlobalTheme.norGray05Color,
                  fontWeight: FontWeight.w300,
                  fontSize: GlobalTheme.xxSmallFontSize),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: 180.w,
      child: Card(
        elevation: .3,
        child: Column(
          children: [
            _buildCover(),
            5.verticalSpace,
            _buildTitle(),
            5.verticalSpace,
            _buildScoreFooter()
          ],
        ),
      ),
    );
  }
}
