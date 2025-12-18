import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/router/routers.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/app_bar_common.dart';
import 'package:recipe_app_ui_kit_food/features/my_recipes/manegers/my_recipe_view_model.dart';

import '../../common/widgets/bottom_navigation_bar_gradient.dart';
import '../../common/widgets/bottom_navigation_bar_main.dart';
import '../../common/widgets/recipe_image_down.dart';
import '../../common/widgets/recipe_image_over.dart';
import '../../common/widgets/search_dialog.dart';

class MyRecipesPage extends StatelessWidget {
  const MyRecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyRecipeViewModel(myRecipeRepo: context.read()),
      builder: (context, child) => Scaffold(
        extendBody: true,
        appBar: AppBarCommon(
          title: "Your Recipes",
          onPressed: () {
            Navigator.pop(context);
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
        body: Consumer<MyRecipeViewModel>(
          builder: (context, vm, child) {
            if (vm.loading) return Center(child: CircularProgressIndicator());
            if (vm.error != null) Center(child: Text(vm.error.toString()));
            return Padding(
              padding: EdgeInsets.only(top: 31.h),
              child: Column(
                children: [
                  Container(
                    width: 430.w,
                    height: 255.h,
                    decoration: BoxDecoration(
                      color: AppColors.watermelonRed,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 38.w, vertical: 14.h),
                    child: Column(
                      spacing: 9.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "most viewed today",
                          style: AppStyles.w500s15w,
                        ),
                        Row(
                          spacing: 16.95.w,
                          children: [
                            ...List.generate(2, (index) {
                              return RecipeImageDown(
                                vm: vm.recipes,
                                index: index,
                                actions: true,
                              );
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.fromLTRB(37.w, 31.h, 37.w, 126.h),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 19.w,
                        mainAxisSpacing: 30.h,
                        mainAxisExtent: 226.h,
                      ),
                      itemCount: vm.recipes.length,
                      itemBuilder: (context, index) {
                        return RecipeImageOver(
                          vm: vm.recipes,
                          index: index,
                          actions: true,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
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
