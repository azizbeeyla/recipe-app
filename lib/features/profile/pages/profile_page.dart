import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/features/profile/managers/profile_view_model.dart';
import 'package:recipe_app_ui_kit_food/features/profile/widgets/profile192.dart';
import 'package:recipe_app_ui_kit_food/features/profile/widgets/profile97.dart';

import '../../common/widgets/bottom_navigation_bar_gradient.dart';
import '../../common/widgets/bottom_navigation_bar_main.dart';
import '../../common/widgets/recipe_image_over.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileViewModel(
        profileRepo: context.read(),
        myRecipeRepo: context.read(),
      ),
      builder: (context, child) => DefaultTabController(
        length: 2,
        child: Scaffold(
          extendBody: true,
          body: Consumer<ProfileViewModel>(
            builder: (context, vm, child) {
              return NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: MyPersistentHeaderDelegate(),
                  ),
                  SliverToBoxAdapter(
                    child: TabBar(
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(width: 3, color: Colors.red),
                        insets: EdgeInsets.symmetric(horizontal: -80),
                      ),
                      dividerColor: Colors.transparent,
                      indicatorColor: AppColors.watermelonRed,
                      tabs: [
                        Tab(
                          child: Text(
                            "Recipe",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Favorites",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                body: TabBarView(
                  children: [
                    GridView.builder(
                      padding: EdgeInsets.fromLTRB(37.w, 19.h, 37.w, 126.h),
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
                    GridView.builder(
                      padding: EdgeInsets.fromLTRB(37.w, 19.h, 37.w, 126.h),
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
      ),
    );
  }
}

class MyPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  Widget getWidget(double shrinkOffset) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double h = constraints.maxHeight;
        if (h > 247.6.h) {
          return ColoredBox(
            color: Theme.of(context).colorScheme.onInverseSurface,
            child: Profile192(),
          );
        }
        return ColoredBox(
          color: Theme.of(context).colorScheme.onInverseSurface,
          child: Profile97(),
        );
      },
    );
  }

  @override
  Widget build(context, shrinkOffset, overlapsContent) {
    return getWidget(shrinkOffset);
  }

  @override
  double get maxExtent => 248.h;

  @override
  double get minExtent => 154.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
