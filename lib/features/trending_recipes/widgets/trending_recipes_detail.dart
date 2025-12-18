import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/like.dart';

import '../../../core/router/routers.dart';
import '../../../data/models/recipe_models/recipes_model.dart';

class TrendingRecipesDetail extends StatelessWidget {
  const TrendingRecipesDetail({
    super.key,
    required this.vm,
    required this.loading,
    this.edit = false,
  });

  final RecipesModel vm;
  final bool loading, edit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          Routers.recipeDetailPage,
          extra: {"title": vm.title, "categoryId": vm.id, "editAppbar": edit},
        );
      },
      child: SizedBox(
        width: 358.w,
        height: 150.h,
        child: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 210.w,
                      height: 122.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: AppColors.watermelonRed,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(
                            14.r,
                          ),
                        ),
                      ),
                      padding: EdgeInsets.all(10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 6.h,
                        children: [
                          Text(
                            vm.title,
                            style: AppStyles.w400s12,
                          ),
                          Text(
                            vm.description,
                            style: AppStyles.w300s11,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "By Chef Josh Ryan",
                            style: AppStyles.w300s11.copyWith(
                              color: AppColors.watermelonRed,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                spacing: 5,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    AppSvgs.clock,
                                  ),
                                  Text(
                                    "${vm.timeRequired}min",
                                    style: AppStyles.w400s12wr,
                                  ),
                                ],
                              ),
                              Row(
                                spacing: 5,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    vm.difficulty,
                                  ),
                                  SvgPicture.asset(
                                    AppSvgs.reyting,
                                  ),
                                ],
                              ),
                              Row(
                                spacing: 5,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "${vm.rating}",
                                  ),
                                  SvgPicture.asset(
                                    AppSvgs.star,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      14.r,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: vm.photo,
                      width: 151.w,
                      height: 150.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 7.h,
                    left: 115.w,
                    child: Like(),
                  ),
                ],
              ),
      ),
    );
  }
}
