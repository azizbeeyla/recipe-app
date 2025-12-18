import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/text_button_popular.dart';
import 'package:recipe_app_ui_kit_food/features/logi_sign_up/widgets/text_field_not_pasword.dart';

class CompleteYourProfilePage extends StatelessWidget {
  CompleteYourProfilePage({super.key});

  final genderController = TextEditingController();
  final bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: AppStyles.w600s20wr,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(36.w, 54.h, 36.w, 48.h),
        child: Column(
          spacing: 12.h,
          children: [
            Column(
              spacing: 20.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Complete your profile", style: AppStyles.w600s20w),
                Text(
                  "Lorem ipsum dolor sit amet pretium cras id dui pellentesque ornare. Quisque malesuada netus pulvinar diam.",
                  style: AppStyles.w400s13w,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Container(
              width: 103.44.w,
              height: 100.81.h,
              decoration: BoxDecoration(
                color: AppColors.pastelPink,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.symmetric(horizontal: 31.w, vertical: 21.h),
              child: SvgPicture.asset(
                AppSvgs.profile,
                colorFilter: ColorFilter.mode(AppColors.watermelonRed, BlendMode.modulate),
              ),
            ),
            TextFieldNotPasword(controller: genderController, text: "Gender", hint: "Male/Female"),
            TextFieldNotPasword(controller: bioController, text: "Bio", hint: "About yourself", maxLine: 4),
            Spacer(),
            TextButtonPopular(
              title: "Continue",
              backgroundColor: AppColors.watermelonRed,
              foregroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
