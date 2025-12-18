import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app_ui_kit_food/core/router/routers.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/like.dart';

import '../../../data/models/recipe_models/recipes_model.dart';

class RecipeImageOver extends StatelessWidget {
  const RecipeImageOver({
    super.key,
    required this.vm,
    required this.index,
    this.actions = false,
  });

  final List<RecipesModel> vm;
  final int index;
  final bool actions;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          Routers.recipeDetailPage,
          extra: {
            "title": vm[index].title,
            "categoryId": vm[index].id,
            "editAppbar": actions,
          },
        );
      },
      child: SizedBox(
        width: 168.5.w,
        height: 226.h,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 158.5.w,
                height: 76.h,
                padding: EdgeInsets.fromLTRB(15.w, 2.h, 15.w, 5.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(14.r),
                  ),
                  color: AppColors.white,
                  border: BoxBorder.all(
                    color: AppColors.rosePink,
                    width: 1.5,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      vm[index].title,
                      style: AppStyles.w400s12,
                    ),
                    Text(
                      vm[index].description,
                      style: AppStyles.w300s11,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 6.w,
                          children: [
                            Text(
                              "${vm[index].rating}",
                              style: AppStyles.w300s11rp,
                            ),
                            SvgPicture.asset(AppSvgs.star),
                          ],
                        ),
                        Row(
                          spacing: 6.w,
                          children: [
                            SvgPicture.asset(AppSvgs.clock),
                            Text(
                              "${vm[index].timeRequired}min",
                              style: AppStyles.w300s11rp,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14.r),
                child: CachedNetworkImage(
                  imageUrl: vm[index].photo,
                  width: 169.w,
                  height: 153.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 7.h,
              left: 133.w,
              child: Like(),
            ),
          ],
        ),
      ),
    );
  }
}
