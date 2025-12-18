import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';

class SettingsModalDiolog extends StatelessWidget {
  const SettingsModalDiolog({
    super.key,
    required this.mainTitle,
    required this.title,
    required this.buttonTitle,
    this.onPressed = _defaultOnPressed,
  });

  final String mainTitle, title,buttonTitle;
  final VoidCallback onPressed;
  static void _defaultOnPressed() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 215.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(50.r)),
      ),
      padding: EdgeInsets.fromLTRB(66.w, 45.h, 66.w, 50.h),
      child: Column(
        spacing: 17.h,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(mainTitle, style: AppStyles.w600s20wr),
          Text(
            title,
            style: AppStyles.w400s15,
            maxLines: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 43.w, vertical: 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: AppColors.pastelPink,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel", style: AppStyles.w500s15wr),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  fixedSize: Size(141.w, 26.h),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: AppColors.watermelonRed,
                ),
                onPressed: onPressed,
                child: Text(buttonTitle, style: AppStyles.w500s15w),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
