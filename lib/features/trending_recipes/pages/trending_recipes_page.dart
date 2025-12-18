import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/app_bar_common.dart';
import 'package:recipe_app_ui_kit_food/features/trending_recipes/widgets/trending_recipes_detail.dart';
import 'package:recipe_app_ui_kit_food/features/trending_recipes/widgets/trending_recipes_viewed.dart';

import '../../../core/router/routers.dart';
import '../../common/widgets/bottom_navigation_bar_gradient.dart';
import '../../common/widgets/bottom_navigation_bar_main.dart';
import '../../common/widgets/search_dialog.dart';
import '../../recipe/manegers/recipe_list_view_model.dart';
import '../manegers/trending_recipes_view_model.dart';

class TrendingRecipesPage extends StatelessWidget {
  const TrendingRecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoriesViewModel(categoryId: 2, recipeRepo: context.read()),
      builder: (context, child) => Scaffold(
        extendBody: true,
        appBar: AppBarCommon(
          title: "Trending Recipes",
          onPressed: () {
            Navigator.of(context).pop();
          },
          oneOnPressed: (){
            context.push(Routers.notifications);
          },
          twoOnPressed: (){
            showDialog(
              context: context,
              useRootNavigator: false,
              builder: (context) {
                return SearchDialog();
              },
            );
          },
        ),
        body: ChangeNotifierProvider(
          create: (context) => TrendingRecipesViewModel(trendingRepo: context.read()),
          builder: (context, child) => SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 31.h, bottom: 126.h),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 241.h,
                    padding: EdgeInsets.fromLTRB(36.w, 9.h, 36.w, 18.h),
                    decoration: BoxDecoration(
                      color: AppColors.watermelonRed,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "most viewed today",
                          style: AppStyles.w500s15w,
                        ),
                        TrendingRecipesViewed(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(36.w, 31.h, 36.w, 0),
                    child: Consumer<CategoriesViewModel>(
                      builder: (context, vm, child) => Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        spacing: 15,
                        children: [
                          Text(
                            "See All",
                            style: AppStyles.w500s12wr.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.watermelonRed,
                            ),
                          ),
                          ...List.generate(vm.recipes.length, (index) {
                            return TrendingRecipesDetail(
                              vm: vm.recipes[index],
                              loading: vm.loading,
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
