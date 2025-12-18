import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_style.dart';
import '../../../core/utils/app_svg.dart';

class NotificationsEmail extends StatelessWidget {
  const NotificationsEmail({
    super.key,
    required this.svg, required this.title,
  });

  final String svg,title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      spacing: 8,
      children: [
        Container(
          width: 355.w,
          height: 75.h,
          decoration: BoxDecoration(
            color: AppColors.pastelPink,
            borderRadius: BorderRadius.circular(14.r),
          ),
          padding: EdgeInsets.fromLTRB(12.w, 15.h, 17.w, 16.h),
          child: Row(
            spacing: 15.25.w,
            children: [
              Container(
                width: 44.75.w,
                height: 45.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(8.w),
                child: SvgPicture.asset(
                  svg,
                  colorFilter: ColorFilter.mode(
                    AppColors.watermelonRed,
                    BlendMode.modulate,
                  ),
                ),
              ),
              SizedBox(
                width: 266.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Weekly New Recipes!",
                      style: AppStyles.w500s15wr,
                    ),
                    Text(
                      "Discover our new recipes of the week!",
                      style: AppStyles.w300s11,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Text(title,style: AppStyles.w300s11w,)
      ],
    );
  }
}
