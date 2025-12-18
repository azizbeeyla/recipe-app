import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';

import '../../../data/models/user/profile_model.dart';

class TopChefModal extends StatelessWidget {
  const TopChefModal({
    super.key,
    required this.vm,
  });

  final ProfileModel vm;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 253.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(50.r),
        ),
      ),
      padding: EdgeInsets.fromLTRB(56.w, 45.h, 56.w, 65.h),
      child: Column(
        spacing: 17.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 15.w,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipOval(
                child: CachedNetworkImage(
                  imageUrl: vm.profilePhoto,
                  width: 64.w,
                  height: 63.h,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                "@ ${vm.username}",
                style: AppStyles.w500s15wr,
              ),
            ],
          ),
          Column(
            spacing: 17.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Copy Profile URL",
                style: AppStyles.w400s13.copyWith(
                  fontSize: 15,
                ),
              ),
              Text(
                "ReportShare this Profile",
                style: AppStyles.w400s13.copyWith(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
