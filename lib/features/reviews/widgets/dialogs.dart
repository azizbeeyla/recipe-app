import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app_ui_kit_food/core/router/routers.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/text_button_popular.dart';

class Dialogs extends StatelessWidget {
  const Dialogs({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 276.w,
        height: 359.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.r),
          color: Colors.white,
        ),
        padding: EdgeInsets.fromLTRB(
          34.5.w,
          46.5.h,
          34.5.w,
          39.5.h,
        ),
        child: Column(
          spacing: 19.2.h,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 171.w,
              child: Text(
                "Thank You For Your Review!",
                style: AppStyles.w600s20.copyWith(color: Colors.black),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
            SvgPicture.asset(AppSvgs.ptichkeKub),
            SizedBox(
              width: 171.w,
              child: Text(
                "Lorem ipsum dolor sit amet pretium cras id dui pellentesque ornare.",
                style: AppStyles.w400s13,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
            TextButtonPopular(
              title: "Go To Home",
              width: 207,
              height: 45,
              backgroundColor: AppColors.watermelonRed,
              style: AppStyles.w600s20w,
              onPressed: () {
                context.go(
                  Routers.reviewsPage,
                  extra: {
                    "categoriyId": id,
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
