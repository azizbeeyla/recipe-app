import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/router/routers.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/app_bar_common.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/text_button_popular.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/manegers/recipe_detail_view_model.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/widgets/recipe_detail_widgets/recipe_detail_profil.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/widgets/recipe_detail_widgets/recipe_detail_lngredients.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/widgets/recipe_detail_widgets/recipe_detail_video_name.dart';

import '../../common/widgets/bottom_navigation_bar_gradient.dart';
import '../../common/widgets/bottom_navigation_bar_main.dart';

class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({
    super.key,
    required this.categoryId,
    required this.title,
    this.editAppbar = false,
  });

  final int categoryId;
  final String title;
  final bool editAppbar;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecipeDetailViewModel(categoryId: categoryId, detailRepo: context.read()),
      builder: (context, child) => Consumer<RecipeDetailViewModel>(
        builder: (context, vm, child) => Scaffold(
          extendBody: true,
          appBar: editAppbar
              ? AppBar(
                  leadingWidth: 100,
                  leading: Center(
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: SvgPicture.asset(AppSvgs.backArrow),
                    ),
                  ),
                  centerTitle: true,
                  title: Text(title, style: AppStyles.w600s20wr),
                  actions: [
                    TextButtonPopular(
                      title: "Edit",
                      width: 62,
                      height: 27,
                      style: AppStyles.w500s15wr,
                      onPressed: () {
                        context.push(
                          Routers.editRecipe,
                          extra: {"edit-retcep": vm.details},
                        );
                      },
                    ),
                    SizedBox(width: 5),
                    SizedBox(
                      width: 28.w,
                      height: 28.h,
                      child: IconButton(
                        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.pastelPink,
                        ),
                        onPressed: () {},
                        icon: SvgPicture.asset(AppSvgs.share),
                      ),
                    ),
                    SizedBox(width: 37.w),
                  ],
                )
              : AppBarCommon(
                  title: title,
                  oneOnPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        width: double.infinity,
                        height: 283.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(50.r)),
                        ),
                        padding: EdgeInsets.fromLTRB(37.w, 45.h, 37.w, 65.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "save to collection",
                              style: AppStyles.w600s20wr,
                            ),
                            ...List.generate(2, (index) {
                              return Row(
                                spacing: 20.w,
                                children: [
                                  Container(
                                    width: 45.w,
                                    height: 45.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.pastelPink,
                                      shape: BoxShape.circle,
                                    ),
                                    padding: EdgeInsets.all(5),
                                    child: SvgPicture.asset(AppSvgs.facebook),
                                  ),
                                  Text(
                                    "sweet",
                                    style: AppStyles.w500s15,
                                  ),
                                ],
                              );
                            }),
                            Container(
                              width: 189.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                color: AppColors.pastelPink,
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 21.w),
                              child: Row(
                                children: [
                                  Text("+ Create Collection", style: AppStyles.w500s15wr),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  oneButtom: AppSvgs.heart,
                  twoButtom: AppSvgs.share,
                ),
          body: vm.loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(36.w, 26.h, 37.w, 126.h),
                    child: Column(
                      spacing: 22.h,
                      children: [
                        RecipeDetailVideoName(
                          vm: vm.details,
                          categoriyId: vm.details.id,
                        ),
                        RecipeDetailProfil(vm: vm.details),
                        Divider(color: AppColors.watermelonRed),
                        RecipeDetailLngredients(vm: vm.details),
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
      ),
    );
  }
}
