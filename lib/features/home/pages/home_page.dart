import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/router/routers.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/search_dialog.dart';

import '../../common/widgets/bottom_navigation_bar_gradient.dart';
import '../../common/widgets/bottom_navigation_bar_main.dart';
import '../manegers/home_view_model.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/home_page_recently.dart';
import '../widgets/home_page_top_chef.dart';
import '../widgets/home_page_trending.dart';
import '../widgets/home_page_your_recipes.dart';
import '../widgets/recipe_list_app_bar_bottom.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          HomeViewModel(
              homeRepo: context.read(),
              recipesRepo: context.read(),
              usersRepo: context.read(),
            )
            ..fetchCategoriy()
            ..fetchRecipe()
            ..fetchTopChef(limit: 4, page: 1)
            ..fetchRecently(),
      builder: (context, child) => Scaffold(
        extendBody: true,
        appBar: AppBarWidget(
          onPressedOne: () {
            context.push(Routers.notifications);
          },
          onPressedTwo: () {
            showDialog(
              context: context,
              useRootNavigator: false,
              builder: (context) {
                return SearchDialog();
              },
            );
          },
          bottom: RecipeListAppBarBottom(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 126.h),
            child: Column(
              spacing: 19.h,
              children: [
                HomePageTrending(),
                HomePageYourRecipes(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 19.h),
                  child: Column(
                    spacing: 19.h,
                    children: [
                      HomePageTopChef(),
                      HomePageRecently(),
                    ],
                  ),
                ),
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
