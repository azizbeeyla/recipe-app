import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';

class TextButtonPopular extends StatelessWidget {
  const TextButtonPopular({
    super.key,
    required this.title,
    this.onPressed = _defaultOnPressed,
    this.backgroundColor = AppColors.pastelPink,
    this.foregroundColor = AppColors.rosePink,
    this.width = 207,
    this.height = 45,
    this.style = AppStyles.w600s20,
  });

  static void _defaultOnPressed() {}
  final String title;
  final VoidCallback onPressed;
  final Color backgroundColor, foregroundColor;
  final double width, height;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: style,
        ),
      ),
    );
  }
}
