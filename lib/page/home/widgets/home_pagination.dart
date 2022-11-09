/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-09 15:23:05
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-09 15:59:35
 * @FilePath: /flutter_clone_bilibili/lib/page/home/widgets/home_pagination.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_clone_bilibili/common/style/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePagination extends StatefulWidget {
  /// 下标
  final int currentIndex;

  /// count
  final int itemCount;
  const HomePagination(
      {Key? key, required this.currentIndex, required this.itemCount})
      : super(key: key);

  @override
  State<HomePagination> createState() => _HomePaginationState();
}

class _HomePaginationState extends State<HomePagination> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.w,
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.itemCount,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: widget.itemCount, childAspectRatio: 5 / 2),
          itemBuilder: ((context, index) {
            return widget.currentIndex == index
                ? Container(
                    decoration: BoxDecoration(
                        color: GlobalTheme.norWhite02Color,
                        borderRadius: BorderRadius.circular(5.r)),
                  )
                : CircleAvatar(
                    backgroundColor: GlobalTheme.norGrayColor,
                    radius: 4.r,
                  );
          })),
    );
  }
}
