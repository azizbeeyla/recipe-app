import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/features/top_chef/manegers/top_chef_view_model.dart';
import 'package:recipe_app_ui_kit_food/features/top_chef/widgets/top_chef_viewed_chef.dart';

class TopChefViewedChefs extends StatelessWidget {
  const TopChefViewedChefs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TopChefViewModel>(
      builder: (context, vm, child) => Container(
        width: 430.w,
        height: 285.h,
        decoration: BoxDecoration(
          color: AppColors.watermelonRed,
          borderRadius: BorderRadius.circular(20.r),
        ),
        padding: EdgeInsets.fromLTRB(36.w, 9.h, 36.w, 27.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Most viewed chefs",
              style: AppStyles.w500s15w,
            ),
            Row(
              spacing: 18.w,
              children: [
                ...List.generate(vm.topChefOne.length, (index) {
                  return TopChefViewedChef(
                    vm: vm.topChefOne,
                    index: index,
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
