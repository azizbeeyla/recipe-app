import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';

class ForgotYourPasswordTexts extends StatelessWidget {
  const ForgotYourPasswordTexts({
    super.key, required this.title1, required this.title2,
  });
  final String title1,title2;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20.h,
      children: [
        Text(
          title1,
          style: AppStyles.w600s20w,
        ),
        Text(
          title2,
          style: AppStyles.w400s13.copyWith(color: Colors.white),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
