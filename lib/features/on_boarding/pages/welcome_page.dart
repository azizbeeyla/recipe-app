import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/text_button_popular.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/manegers/category_view_model.dart';

import '../../../core/router/routers.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoryViewModel(catRepo: context.read()),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(AppSvgs.backArrow),
          ),
        ),
        body: Consumer<CategoryViewModel>(
          builder: (context, vm, child) => Padding(
            padding: EdgeInsets.fromLTRB(36.w, 5.h, 38.w, 35.35.h),
            child: Column(
              spacing: 12,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 356.w,
                  height: 557.h,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 26.w,
                      mainAxisSpacing: 27.h,
                      mainAxisExtent: 167.h,
                    ),
                    itemCount: vm.recipe.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(14.67.r),
                        child: CachedNetworkImage(
                          imageUrl: vm.recipe[index].image,
                          width: 166.w,
                          height: 167.h,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  "Welcome",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(
                  width: 336.w,
                  child: Text(
                    "Find the best recipes that the world can provide you also with every step that you can learn to increase your cooking skills.",
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                  ),
                ),
                TextButtonPopular(
                  title: "I’m New",
                  onPressed: () {
                    context.push(Routers.onBoardingCookingLevelPage);
                  },
                ),
                TextButtonPopular(
                  title: "I’ve Been Here",
                  onPressed: () {
                    // context.read<AppThemeViewModel>().toggleTheme();
                    context.go(Routers.login);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
