import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app_ui_kit_food/core/router/routers.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_svg.dart';

class SuccesModel extends StatelessWidget {
  const SuccesModel({
    super.key,
    required this.title1,
    required this.title2,
  });

  final String title1, title2;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 249.w,
        height: 305.h,
        padding: EdgeInsets.fromLTRB(21.w, 16.h, 21.w, 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 133.w,
              height: 44.h,
              child: Text(
                title1,
                style: AppStyles.w600s20,
                textAlign: TextAlign.center,
              ),
            ),
            SvgPicture.asset(
              AppSvgs.ptichkeKub,
              colorFilter: ColorFilter.mode(
                AppColors.watermelonRed,
                BlendMode.modulate,
              ),
            ),
            Text(
              title2,
              style: AppStyles.w400s13,
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
            ElevatedButton(
              onPressed: () {
                context.go(Routers.login);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.watermelonRed,
              ),
              child: Text(
                "Go to home",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}