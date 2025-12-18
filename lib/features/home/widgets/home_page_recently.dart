import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/recipe_image_over.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/like.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_style.dart';
import '../../../core/utils/app_svg.dart';
import '../manegers/home_view_model.dart';

class HomePageRecently extends StatelessWidget {
  const HomePageRecently({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recently Added",
          style: AppStyles.w500s15wr,
        ),
        Consumer<HomeViewModel>(
          builder: (context, vm, child) => vm.recentlyLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Row(
                  spacing: 18.47.w,
                  children: [
                    ...List.generate(vm.recently.length, (index) {
                      return RecipeImageOver(vm: vm.recently, index: index);
                    }),
                  ],
                ),
        ),
      ],
    );
  }
}
