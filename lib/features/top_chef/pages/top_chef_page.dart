import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/app_bar_common.dart';
import 'package:recipe_app_ui_kit_food/features/top_chef/manegers/top_chef_view_model.dart';
import 'package:recipe_app_ui_kit_food/features/top_chef/widgets/top_chef_viewed_chef.dart';
import 'package:recipe_app_ui_kit_food/features/top_chef/widgets/top_chef_viewed_chefs.dart';

import '../../../core/router/routers.dart';
import '../../common/widgets/bottom_navigation_bar_gradient.dart';
import '../../common/widgets/bottom_navigation_bar_main.dart';
import '../../common/widgets/search_dialog.dart';

class TopChefPage extends StatelessWidget {
  const TopChefPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          TopChefViewModel(
              topChetOneRepo: context.read(),
              topChetTwoRepo: context.read(),
              topChetThreeRepo: context.read(),
            )
            ..fetchTopChefOne(limit: 2, page: 1)
            ..fetchTopChefTwo(limit: 2, page: 2)
            ..fetchTopChefThree(limit: 2, page: 3),
      builder: (context, child) => Scaffold(
        extendBody: true,
        appBar: AppBarCommon(
          title: "Top Chef",
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 126.h),
            child: Column(
              spacing: 15.h,
              children: [
                TopChefViewedChefs(),
                Padding(
                  padding: EdgeInsets.fromLTRB(37.w, 15.h, 37.w, 0),
                  child: Column(
                    spacing: 17.h,
                    children: [
                      Consumer<TopChefViewModel>(
                        builder: (context, vm, child) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 9,
                          children: [
                            Text(
                              "Most Liked chefs",
                              style: AppStyles.w500s15wr,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ...List.generate(vm.topChefTwo.length, (index) {
                                  return TopChefViewedChef(
                                    vm: vm.topChefTwo,
                                    index: index,
                                  );
                                }),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Consumer<TopChefViewModel>(
                        builder: (context, vm, child) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 9,
                          children: [
                            Text(
                              "Most Liked chefs",
                              style: AppStyles.w500s15wr,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ...List.generate(vm.topChefTwo.length, (index) {
                                  return TopChefViewedChef(
                                    vm: vm.topChefThree,
                                    index: index,
                                  );
                                }),
                              ],
                            ),
                          ],
                        ),
                      ),
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
