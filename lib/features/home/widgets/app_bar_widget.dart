import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/center_loading.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/icon_popular.dart';

import '../../../core/utils/app_style.dart';
import '../../../core/utils/app_svg.dart';
import '../../profile/managers/profile_view_model.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    this.bottom,
    this.onPressedOne = _defaultOnPressed,
    this.onPressedTwo = _defaultOnPressed,
  });

  final PreferredSizeWidget? bottom;
  final VoidCallback onPressedOne, onPressedTwo;

  static void _defaultOnPressed() {}

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ChangeNotifierProvider(
            create: (context) => ProfileViewModel(profileRepo: context.read(), myRecipeRepo: context.read()),
            builder: (context, child) => Consumer<ProfileViewModel>(
              builder: (context, vm, child) => vm.loading
                  ? CenterLoading()
                  : Text(
                      "Hi! ${vm.profile.firstName}",
                      style: AppStyles.w400s25wr,
                    ),
            ),
          ),
          Text(
            "What are you cooking today",
            style: AppStyles.w400s13w,
          ),
        ],
      ),
      actionsPadding: EdgeInsetsGeometry.only(bottom: 27.h, right: 38.w),
      actions: [
        IconPopular(
          icon: AppSvgs.notification,
          onPressed: onPressedOne,
        ),
        SizedBox(width: 5.w),
        IconPopular(
          icon: AppSvgs.search,
          onPressed: onPressedTwo,
        ),
      ],
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, bottom != null ? 113 : 61);
}
