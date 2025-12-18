import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/router/routers.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';
import 'package:recipe_app_ui_kit_food/features/reviews/manegers/reviews_view_model.dart';

class ReviewsAddReview extends StatelessWidget {
  const ReviewsAddReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ReviewsViewModel>(
      builder: (context, vm, child) => Container(
        width: 430.w,
        height: 223.24.h,
        decoration: BoxDecoration(
          color: AppColors.watermelonRed,
          borderRadius: BorderRadius.circular(20.r),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(37.w, 30.h, 37.w, 30.h),
        child: vm.loadingDetail
            ? CircularProgressIndicator()
            : Row(
                spacing: 15.w,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14.34.r),
                    child: CachedNetworkImage(
                      imageUrl: vm.review.photo,
                      width: 162.26.w,
                      height: 163.24.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    spacing: 5.h,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vm.review.title,
                        style: AppStyles.w500s20w,
                      ),
                      Row(
                        spacing: 4.68.w,
                        children: [
                          ...List.generate(
                            vm.review.rating.toInt(),
                            (
                              index,
                            ) {
                              return SvgPicture.asset(
                                AppSvgs.starFilled,
                              );
                            },
                          ),
                          ...List.generate(
                            5 - vm.review.rating.toInt(),
                            (
                              index,
                            ) {
                              return SvgPicture.asset(
                                AppSvgs.starEmpty,
                              );
                            },
                          ),
                          Text(
                            "(${vm.review.reviewsCount} reviews)",
                            style: AppStyles.w400s12w,
                          ),
                        ],
                      ),
                      Row(
                        spacing: 5.w,
                        children: [
                          ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: vm.review.user.profilePhoto,
                              width: 32.18.w,
                              height: 33.24.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 141.54.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "@${vm.review.user.username}",
                                  style: AppStyles.w400s13w,
                                ),
                                Text(
                                  "${vm.review.user.firstName} ${vm.review.user.lastName}-chef",
                                  style: AppStyles.w300s11w,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          fixedSize: Size(126.w, 24.h),
                        ),
                        onPressed: () {
                          context.push(Routers.reviewsAddPage,extra: {
                            "categoriyId": vm.review.id,
                          },);
                        },
                        child: Text(
                          "Add Review",
                          style: AppStyles.w500s15wr,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
