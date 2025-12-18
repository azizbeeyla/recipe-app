import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app_ui_kit_food/core/router/routers.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';

import '../../../data/models/top_chef_models/top_chef_model.dart';

class TopChefViewedChef extends StatefulWidget {
  const TopChefViewedChef({
    super.key,
    required this.vm,
    required this.index,
    this.star = 6687,
  });

  final List<TopChefModel> vm;
  final int index, star;

  @override
  State<TopChefViewedChef> createState() => _TopChefViewedChefState();
}

class _TopChefViewedChefState extends State<TopChefViewedChef> {
  bool follow = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          Routers.topChefDetail,
          extra: {"id": widget.vm[widget.index].id},
        );
      },
      child: SizedBox(
        width: 170.w,
        height: 217.h,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 160.w,
                height: 76.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: AppColors.watermelonRed,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(14.r),
                  ),
                ),
                padding: EdgeInsets.fromLTRB(10.w, 4.h, 10.w, 10.h),
                alignment: Alignment.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "${widget.vm[widget.index].firstName} ${widget.vm[widget.index].lastName}",
                      style: AppStyles.w400s12,
                      maxLines: 1,
                    ),
                    Text(
                      "@${widget.vm[widget.index].username}",
                      style: AppStyles.w300s11rp.copyWith(
                        color: AppColors.watermelonRed,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 6,
                          children: [
                            Text(
                              "${widget.star}",
                              style: AppStyles.w400s12wr,
                            ),
                            SvgPicture.asset(AppSvgs.star),
                          ],
                        ),
                        Row(
                          spacing: 6,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: follow ? AppColors.pastelPink : AppColors.watermelonRed,
                                foregroundColor: follow ? AppColors.rosePink : Colors.white,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 2,
                                  vertical: 2,
                                ),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                minimumSize: Size(43.60.w, 13.78.h),
                              ),
                              onPressed: () {
                                follow = !follow;
                                setState(() {});
                              },
                              child: Text(
                                follow ? "Follow" : "Following",
                                style: AppStyles.w500s8,
                              ),
                            ),
                            Container(
                              width: 13.72.w,
                              height: 13.68.h,
                              decoration: BoxDecoration(
                                color: AppColors.watermelonRed,
                                borderRadius: BorderRadius.circular(5.64.r),
                              ),
                              padding: EdgeInsets.all(1),
                              child: SvgPicture.asset(AppSvgs.share),
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
                  imageUrl: widget.vm[widget.index].profilePhoto,
                  width: 170.w,
                  height: 153.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
