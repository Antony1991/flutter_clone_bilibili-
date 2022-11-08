/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-08 13:32:41
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-08 23:03:26
 * @FilePath: /flutter_clone_bilibili/lib/page/home/widgets/home_video_item.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_clone_bilibili/common/style/icons.dart';
import 'package:flutter_clone_bilibili/common/style/theme.dart';
import 'package:flutter_clone_bilibili/model/FeedIndexModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeVideoItem extends StatefulWidget {
  final FeedIndexItem feedIndexItem;
  const HomeVideoItem(this.feedIndexItem, {Key? key}) : super(key: key);

  @override
  State<HomeVideoItem> createState() => _HomeVideoItemState();
}

class _HomeVideoItemState extends State<HomeVideoItem> {
  /// 视频封面
  Widget _buildCover() {
    return Stack(
      children: [_buildCoverImg(), _buildCoverContent()],
    );
  }

  /// 视频封面图片
  Widget _buildCoverImg() {
    if (widget.feedIndexItem.cardType == "cm_v2") {
      return ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.r), topRight: Radius.circular(5.r)),
        child: SizedBox(
          width: 180.w,
          height: 120.h,
          child: FadeInImage(
            placeholder: const AssetImage(GlobalIcons.videoPlaceHolderDefault),
            image: NetworkImage(
                widget.feedIndexItem.adInfo!.creativeContent!.imageUrl!),
            fit: BoxFit.fill,
            placeholderFit: BoxFit.fill,
          ),
        ),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5.r), topRight: Radius.circular(5.r)),
      child: SizedBox(
        width: 180.w,
        height: 120.h,
        child: FadeInImage(
          placeholder: const AssetImage(GlobalIcons.videoPlaceHolderDefault),
          image: NetworkImage(widget.feedIndexItem.cover!),
          fit: BoxFit.fill,
          placeholderFit: BoxFit.fill,
        ),
      ),
    );
  }

  /// 视频封面阴影等
  Widget _buildCoverContent() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Stack(
        children: [
          Container(
            height: 35.h,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(.8), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
          ),
          _buildCoverActions()
        ],
      ),
    );
  }

  /// 视频封面actions
  Widget _buildCoverActions() {
    return Positioned(
      left: 5.sp,
      right: 5.sp,
      bottom: 5.sp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_buildActionLeft(), _buildActionTime()],
      ),
    );
  }

  /// 封面left
  Widget _buildActionLeft() {
    if (widget.feedIndexItem.goto == 'live') {
      return Row(
        children: [
          _buildActionBtn(
              GlobalIcons.icVideoPlay, widget.feedIndexItem.coverLeftText1!),
        ],
      );
    } else if (widget.feedIndexItem.goto == 'av') {
      return Row(
        children: [
          _buildActionBtn(
              GlobalIcons.icVideoPlay, widget.feedIndexItem.coverLeftText1!),
          5.horizontalSpace,
          _buildActionBtn(
              GlobalIcons.icVideoDanmu, widget.feedIndexItem.coverLeftText2!)
        ],
      );
    } else if (widget.feedIndexItem.goto == 'bangumi') {
      return Row(
        children: [
          _buildActionBtn(
              GlobalIcons.icVideoPlay, widget.feedIndexItem.coverLeftText1!),
          5.horizontalSpace,
          _buildActionBtn(
              GlobalIcons.icVideoDanmu, widget.feedIndexItem.coverLeftText2!)
        ],
      );
    }
    return const SizedBox();
  }

  /// 渲染单个actionBtn
  Widget _buildActionBtn(String iconName, String label) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            iconName,
            width: 14.sp,
            height: 14.sp,
          ),
          5.horizontalSpace,
          Text(label,
              style: TextStyle(
                  color: GlobalTheme.norWhite02Color,
                  fontSize: GlobalTheme.xxxSmallFontSize))
        ],
      ),
    );
  }

  /// 封面时间
  Widget _buildActionTime() {
    if (widget.feedIndexItem.coverRightText != null) {
      return Text(widget.feedIndexItem.coverRightText!,
          style: TextStyle(
              color: GlobalTheme.norWhite02Color,
              fontSize: GlobalTheme.xxxSmallFontSize));
    } else if (widget.feedIndexItem.badge != null) {
      return Text(widget.feedIndexItem.badge!,
          style: TextStyle(
              color: GlobalTheme.norWhite02Color,
              fontSize: GlobalTheme.xxxSmallFontSize));
    }
    return const SizedBox();
  }

  /// 渲染标题
  Widget _buildTitle() {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8).r,
      child: Text(
        widget.feedIndexItem.title!,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: GlobalTheme.norTextColor,
            fontSize: GlobalTheme.xxSmallFontSize),
      ),
    );
  }

  /// 渲染视频up主信息
  Widget _buildHomeVideoBottomInfo() {
    if (widget.feedIndexItem.goto == 'av') {
      return _buildBottomAv();
    }
    return const SizedBox();
  }

  /// 渲染视频up信息 av 类型
  Widget _buildBottomAv() {
    if (widget.feedIndexItem.rcmdReasonStyle != null) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 2).r,
        decoration: BoxDecoration(
            color: const Color(0xff1f2323),
            borderRadius: BorderRadius.all(Radius.circular(2.r)),
            border: Border.all(color: const Color(0xfff00f00))),
        child: Text(
          widget.feedIndexItem.rcmdReasonStyle!.text!,
          style: TextStyle(
            fontSize: GlobalTheme.xxxSmallFontSize,
            color: const Color(0xff1f2323),
          ),
        ),
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      // crossAxisAlignment: CrossAxisAlignment.baseline,
      children: [
        Image.asset(GlobalIcons.videoUperCustom, width: 14.sp, height: 14.sp),
        4.horizontalSpace,
        SizedBox(
          width: 100.w,
          child: Text(
            widget.feedIndexItem.args!.upName!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: GlobalTheme.xxxSmallFontSize,
                color: GlobalTheme.norGrayColor),
          ),
        )
      ],
    );
  }

  /// 渲染视频up信息 veertical_av 类型
  /// 渲染视频up信息 live 类型
  /// 渲染视频up信息 bangumi 类型
  /// 渲染更多
  Widget _buildHomeVideoMoreIcon() {
    return Image.asset(
      GlobalIcons.videoMoreIc,
      width: 14.sp,
      height: 14.sp,
    );
  }

  /// 渲染footer
  Widget _buildCoverFooter() {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 5, bottom: 5).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// 视频up主信息
          _buildHomeVideoBottomInfo(),

          /// 视频右下角更多按钮
          _buildHomeVideoMoreIcon()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          _buildCover(),
          SizedBox(
            height: 70.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_buildTitle(), _buildCoverFooter()],
            ),
          )
        ],
      ),
    );
  }
}
