import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/features/reviews/widgets/add_reviews.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_style.dart';
import '../../../core/utils/app_svg.dart';
import '../../common/widgets/bottom_navigation_bar_gradient.dart';
import '../../common/widgets/bottom_navigation_bar_main.dart';
import '../manegers/reviews_add_view_model.dart';

class ReviewsAddPage extends StatelessWidget {
  const ReviewsAddPage({super.key, required this.categoriyId});

  final int categoriyId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReviewsAddViewModel(
        categoryId: categoriyId,
        recipesRepo: context.read(),
        reviewsRepo: context.read(),
      ),
      builder: (context, child) => Scaffold(
        extendBody: true,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(AppSvgs.backArrow),
          ),
          title: Text(
            "Leave a Review",
            style: AppStyles.w600s20wr,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(37.w, 17.h, 37.w, 126.h),
            child: Column(
              spacing: 25.h,
              children: [
                Consumer<ReviewsAddViewModel>(
                  builder: (context, vm, child) => SizedBox(
                    width: 356.w,
                    height: 262.h,
                    child: vm.loading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Stack(
                            children: [
                              Container(
                                width: 356.w,
                                height: 262.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: AppColors.watermelonRed,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 16.h,
                                ),
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  vm.commentsAdd.title,
                                  style: AppStyles.w500s20w,
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: CachedNetworkImage(
                                    imageUrl: vm.commentsAdd.photo,
                                    width: 356.w,
                                    height: 206.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
                AddReviews(id: categoriyId,),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            BottomNavigationBarGradient(),
            BottomNavigationBarMain(),
          ],
        ),
      ),
    );
  }
}
