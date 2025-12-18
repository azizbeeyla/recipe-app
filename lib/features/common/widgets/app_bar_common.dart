import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';

import '../../../core/utils/app_colors.dart';

class AppBarCommon extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCommon({
    super.key,
    required this.title,
    this.bottom,
    this.onPressed = _defaultPressed,
    this.oneButtom = AppSvgs.notification,
    this.twoButtom = AppSvgs.search,
    this.oneOnPressed = _defaultPressed,
    this.twoOnPressed = _defaultPressed,
    this.action = true,
    this.titleCenter = true,
  });

  static void _defaultPressed() {}

  final String title;
  final bool action,titleCenter;
  final PreferredSizeWidget? bottom;
  final VoidCallback onPressed, oneOnPressed, twoOnPressed;
  final String oneButtom, twoButtom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 100,
      leading: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: SvgPicture.asset(AppSvgs.backArrow),
        ),
      ),
      centerTitle: titleCenter,
      title: Text(
        title,
        style: AppStyles.w600s20wr,
      ),
      actions: action
          ? [
              SizedBox(
                width: 28.w,
                height: 28.h,
                child: IconButton(
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.pastelPink,
                  ),
                  onPressed: oneOnPressed,
                  icon: SvgPicture.asset(oneButtom),
                ),
              ),
              SizedBox(width: 5),
              SizedBox(
                width: 28.w,
                height: 28.h,
                child: IconButton(
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.pastelPink,
                  ),
                  onPressed: twoOnPressed,
                  icon: SvgPicture.asset(twoButtom),
                ),
              ),
              SizedBox(width: 37.w),
            ]
          : [],
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, bottom != null ? 98 : 61);
}
