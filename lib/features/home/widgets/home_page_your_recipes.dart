import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/router/routers.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_style.dart';
import '../../common/widgets/recipe_image_down.dart';
import '../manegers/home_view_model.dart';

class HomePageYourRecipes extends StatelessWidget {
  const HomePageYourRecipes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routers.myRecipe);
      },
      child: Container(
        width: double.infinity,
        height: 255.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.watermelonRed,
        ),
        padding: EdgeInsets.symmetric(horizontal: 38.w, vertical: 14.h),
        child: Column(
          spacing: 9.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your recipes",
              style: AppStyles.w500s15wr.copyWith(color: Colors.white),
            ),
            Consumer<HomeViewModel>(
              builder: (context, vm, child) => vm.recipeLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 16.95.w,
                      children: [
                        ...List.generate(vm.recipe.length, (index) {
                          return RecipeImageDown(
                            vm: vm.recipe,
                            index: index,
                          );
                        }),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
