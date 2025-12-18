import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app_ui_kit_food/core/router/routers.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';
import '../../../../data/models/recipe_models/recipe_detail_model.dart';


class RecipeDetailVideoName extends StatelessWidget {
  const RecipeDetailVideoName({
    super.key, required this.vm, required this.categoriyId,
  });
  final RecipeDetailModel vm;
  final int categoriyId;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 357.w,
      height: 337.h,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 357.w,
              height: 337.h,
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 16.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.watermelonRed,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    vm.title,
                    style: AppStyles.w500s20w,
                  ),
                  GestureDetector(
                    onTap: (){
                      context.push(
                        Routers.reviewsPage,
                        extra: {
                          "categoriyId": categoriyId,
                        },
                      );
                    },
                    child: Row(
                      spacing: 4,
                      children: [
                        SvgPicture.asset(AppSvgs.starFilled),
                        Text(
                          "${vm.rating}",
                          style: AppStyles.w400s12w,
                        ),
                        SizedBox(),
                        SvgPicture.asset(AppSvgs.reviews),
                        Text(
                          "2.273",
                          style: AppStyles.w400s12w,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: vm.videoRecipe,
                width: 357.w,
                height: 281.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 105.h,
            left: 142.w,
            child: Container(
              width: 74.01.w,
              height: 71.46.h,
              padding: EdgeInsets.fromLTRB(
                24.67.w,
                14.7.h,
                19.41.w,
                16.68.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.watermelonRed,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(AppSvgs.play),
            ),
          ),
        ],
      ),
    );
  }
}
