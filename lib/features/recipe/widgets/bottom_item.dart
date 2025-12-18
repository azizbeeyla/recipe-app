import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/pages/recipe_list_page.dart';

import '../../../core/router/routers.dart';
import '../../../core/utils/app_colors.dart';

class BottomItem extends StatelessWidget {
  const BottomItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.id,
  });

  final int id;
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          Routers.recipeListPage,
          extra: {
            "appBarTitle": title,
            "categoryId": id,
          },
        );

      },
      child: Container(
        height: 25.h,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 9.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.watermelonRed : Colors.transparent,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.watermelonRed,
          ),
        ),
      ),
    );
  }
}