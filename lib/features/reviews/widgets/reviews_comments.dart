import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';

import '../manegers/reviews_view_model.dart';

class ReviewsComments extends StatelessWidget {
  const ReviewsComments({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ReviewsViewModel>(
      builder: (context, vm, child) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 36.w),
        child: Column(
          spacing: 17.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Comments",
              style: AppStyles.w500s15wr,
            ),
            ...List.generate(vm.comments.length, (index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 11.h,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 13.w,
                        children: [
                          ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: vm.comments[index].user.profilePhoto,
                              width: 46.w,
                              height: 42.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            "@ ${vm.comments[index].user}",
                            style: AppStyles.w400s12wr.copyWith(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Text("(${vm.comments[index].created})"),
                    ],
                  ),
                  Text(
                    vm.comments[index].comment,
                    style: AppStyles.w300s11w,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    spacing: 4.68.w,
                    children: [
                      ...List.generate(
                        vm.comments[index].rating.toInt(),
                        (
                          index,
                        ) {
                          return SvgPicture.asset(
                            AppSvgs.starFilled,
                            colorFilter: ColorFilter.mode(
                              AppColors.watermelonRed,
                              BlendMode.modulate,
                            ),
                          );
                        },
                      ),
                      ...List.generate(
                        5 - vm.comments[index].rating.toInt(),
                        (
                          index,
                        ) {
                          return SvgPicture.asset(
                            AppSvgs.starEmpty,
                            colorFilter: ColorFilter.mode(
                              AppColors.watermelonRed,
                              BlendMode.modulate,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
