import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/app_bar_common.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/manegers/category_view_model.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/widgets/category_detail.dart';

import '../../../core/router/routers.dart';
import '../../common/widgets/bottom_navigation_bar_gradient.dart';
import '../../common/widgets/bottom_navigation_bar_main.dart';
import '../../common/widgets/search_dialog.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoryViewModel(catRepo: context.read()),
      builder: (context, child) => Scaffold(
        extendBody: true,
        appBar: AppBarCommon(
          title: "Categories",
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
        body: Consumer<CategoryViewModel>(
          builder: (context, vm, child) => GridView.builder(
            padding: EdgeInsets.fromLTRB(37.w, 14.h, 37.w, 126.h),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 38.9.w,
              mainAxisSpacing: 8.h,
              mainAxisExtent: 171.55.h,
            ),
            itemCount: vm.recipe.length,
            itemBuilder: (context, index) {
              return CategoriyDetail(categoriy: vm.recipe[index],);
            },
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
