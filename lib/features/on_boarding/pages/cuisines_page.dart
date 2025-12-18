import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/router/routers.dart';
import 'package:recipe_app_ui_kit_food/features/on_boarding/manegers/cuisines_view_model.dart';
import 'package:recipe_app_ui_kit_food/features/on_boarding/widgets/grid_view_image.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_style.dart';
import '../../../core/utils/app_svg.dart';
import '../../../core/utils/themes.dart';
import '../../common/widgets/bottom_navigation_bar_gradient.dart';
import '../../common/widgets/text_button_popular.dart';
import '../widgets/scroll_conteyner.dart';

class CuisinesPage extends StatelessWidget {
  const CuisinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CuisinesViewModel(cuisineRepo: context.read())..fetchAllergic(),
      builder: (context, child) => Scaffold(
        extendBody: true,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: SvgPicture.asset(AppSvgs.backArrow),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(15),
            child: ScroolConteyner(
              vm: 1,
            ),
          ),
        ),
        body: Consumer<CuisinesViewModel>(
          builder: (context, vm, child) => vm.loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: EdgeInsets.fromLTRB(36, 55.h, 38, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 20,
                    children: [
                      Text(
                        "Select your cuisines preferences",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Text(
                        "Please select your cuisines preferences for a better recommendations or you can skip it.",
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 2,
                      ),
                      Expanded(
                        child: GridView.builder(
                          padding: EdgeInsets.only(bottom: 126.h),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 9.72.w,
                            mainAxisSpacing: 11.21.h,
                            mainAxisExtent: 125.49.h,
                          ),
                          itemCount: vm.cuisine.length,
                          itemBuilder: (context, index) => GridViewImage(
                            vm: vm.cuisine,
                            index: index,
                          ),
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
            Padding(
              padding: EdgeInsets.only(left: 36, right: 38, bottom: 34.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButtonPopular(
                    title: "skip",
                    width: 162,
                    onPressed: () {
                      // context.read<AppThemeViewModel>().toggleTheme();
                      context.go(Routers.login, extra: {});
                    },
                  ),
                  TextButtonPopular(
                    title: "Continue",
                    backgroundColor: AppColors.watermelonRed,
                    foregroundColor: Colors.white,
                    width: 162,
                    onPressed: () {
                      context.push(Routers.onBoardingAllergicPage, extra: {});
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
