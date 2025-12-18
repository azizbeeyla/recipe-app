import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app_ui_kit_food/core/router/routers.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/like.dart';

import '../../../core/utils/app_style.dart';
import '../../../core/utils/app_svg.dart';
import '../../../data/models/recipe_models/recipes_model.dart';

class RecipeImageDown extends StatelessWidget {
  const RecipeImageDown({
    super.key,
    required this.vm,
    required this.index,
    this.actions = false,
  });

  final List<RecipesModel> vm;
  final bool actions;
  final int index;

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
        width: 168.52.w,
        height: 195.h,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(13.r),
                ),
                child: CachedNetworkImage(
                  imageUrl: vm[index].photo,
                  width: 168.52.w,
                  height: 162.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 168.52.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(
                        alpha: 0.45,
                      ),
                      spreadRadius: 0,
                      blurRadius: 5,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                  vertical: 5.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      vm[index].title,
                      style: AppStyles.w400s12rp.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      spacing: 26.w,
                      children: [
                        Row(
                          children: [
                            Text(
                              "${vm[index].rating}",
                              style: AppStyles.w400s12rp,
                            ),
                            SvgPicture.asset(AppSvgs.star),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(AppSvgs.clock),
                            Text(
                              "${vm[index].timeRequired} min",
                              style: AppStyles.w400s12rp,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 7.h,
              left: 132.w,
              child: Like(icon: AppSvgs.heart),
            ),
          ],
        ),
      ),
    );
  }
}
