import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app_ui_kit_food/core/router/routers.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_list.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/text_button_popular.dart';
import 'package:recipe_app_ui_kit_food/features/on_boarding/widgets/cooking_level_text.dart';
import 'package:recipe_app_ui_kit_food/features/on_boarding/widgets/scroll_conteyner.dart';

import '../../../../../core/utils/app_colors.dart';

import '../../../../../core/utils/app_svg.dart';


class CookingLevelPage extends StatelessWidget {
  const CookingLevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            vm: 0,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(36, 55.h, 38, 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Text(
              "¿What is your cooking level?",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              "Please select you cooking level for a better recommendations.",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ...List.generate(
              AppList.cookingLevel.length,
              (index) {
                return CookingLevelText(index: index);
              },
            ),
            Spacer(),
            Center(
              child: TextButtonPopular(
                title: "Continue",
                backgroundColor: AppColors.watermelonRed,
                foregroundColor: Colors.white,
                onPressed: (){
                  // context.read<AppThemeViewModel>().toggleTheme();
                  context.push(Routers.onBoardingPreferencesPage,extra: {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
