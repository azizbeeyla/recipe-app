import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/text_button_popular.dart';

import '../../../data/models/user/profile_model.dart';

class ShareProfilePage extends StatelessWidget {
  const ShareProfilePage({super.key, required this.user});

  final ProfileModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.watermelonRed,
      appBar: AppBar(
        backgroundColor: AppColors.watermelonRed,
        leading: Center(
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(AppSvgs.backArrowWhite),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(37.w, 159.5.h, 37.w, 220.h),
        child: Column(
          spacing: 24.05.h,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 362.w,
              height: 378.98.h,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
              padding: EdgeInsets.fromLTRB(56.5.w, 30.h, 56.5.w, 40.h),
              child: Column(
                spacing: 31.h,
                children: [
                  Text(
                    "@${user.username}",
                    style: AppStyles.w600s20wr,
                  ),
                  QrImageView(
                    data: '@${user.username}',
                    version: QrVersions.auto,
                    size: 250.w,
                    gapless: false,
                    backgroundColor: Colors.white,
                    eyeStyle: QrEyeStyle(eyeShape: QrEyeShape.square, color: AppColors.rosePink),
                    dataModuleStyle: QrDataModuleStyle(
                      dataModuleShape: QrDataModuleShape.square,
                      color: AppColors.rosePink,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButtonPopular(
                  title: "Share Profile",
                  style: AppStyles.w500s15wr,
                  backgroundColor: Colors.white,
                  width: 116.67,
                  height: 35,
                ),
                TextButtonPopular(
                  title: "Copy link",
                  style: AppStyles.w500s15wr,
                  backgroundColor: AppColors.pastelPink,
                  width: 116.67,
                  height: 35,
                ),
                TextButtonPopular(
                  title: "Download",
                  style: AppStyles.w500s15wr,
                  backgroundColor: AppColors.pastelPink,
                  width: 116.67,
                  height: 35,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
