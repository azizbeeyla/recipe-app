import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/like.dart';

import '../manegers/trending_recipes_view_model.dart';

class TrendingRecipesViewed extends StatelessWidget {
  const TrendingRecipesViewed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TrendingRecipesViewModel>(
      builder: (context, vm, child) => SizedBox(
        width: 358.w,
        height: 182.h,
        child: vm.loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 348.w,
                      height: 49.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(14.r),
                        ),
                      ),
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.only(
                        bottom: 2,
                        left: 15.w,
                        right: 15.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 264.31.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  vm.details.title,
                                  style: AppStyles.w400s13,
                                ),
                                Text(
                                  vm.details.description,
                                  style: AppStyles.w300s11,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                spacing: 6,
                                children: [
                                  SvgPicture.asset(AppSvgs.clock),
                                  Text(
                                    "${vm.details.timeRequired}min",
                                    style: AppStyles.w400s12wr,
                                  ),
                                ],
                              ),
                              Row(
                                spacing: 6,
                                children: [
                                  Text(
                                    "${vm.details.rating}",
                                    style: AppStyles.w400s12wr,
                                  ),
                                  SvgPicture.asset(AppSvgs.star),
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
                        imageUrl: vm.details.photo,
                        width: 358.w,
                        height: 143.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 7.h,
                    left: 322.w,
                    child: Like(),
                  ),
                ],
              ),
      ),
    );
  }
}
