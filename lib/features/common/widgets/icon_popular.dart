import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';

class IconPopular extends StatelessWidget {
  const IconPopular({
    super.key,
    this.icon = AppSvgs.notification,
    this.width = 28,
    this.height = 28,
    this.onPressed = _defaultOnPressed,
  });

  final String icon;
  final double width, height;
  final VoidCallback onPressed;

  static void _defaultOnPressed() {}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: IconButton(
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        style: IconButton.styleFrom(
          backgroundColor: AppColors.pastelPink,
        ),
        onPressed: onPressed,
        icon: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(
            AppColors.rosePink,
            BlendMode.modulate,
          ),
        ),
      ),
    );
  }
}
