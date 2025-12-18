import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/text_button_popular.dart';
import 'package:recipe_app_ui_kit_food/features/home/widgets/search_dialog_container.dart';

class SearchDialog extends StatelessWidget {
  const SearchDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: double.infinity,
          height: 460.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(50.r)),
          ),
          padding: EdgeInsets.fromLTRB(37.w, 71.h, 37.w, 51.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15.h,
            children: [
              TextField(
                style: AppStyles.w400s12wr,
                decoration: InputDecoration(
                  constraints: BoxConstraints(maxHeight: 34.h),
                  filled: true,
                  fillColor: AppColors.pastelPink,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.r),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Search",
                  hintStyle: AppStyles.w400s12wr,
                ),
              ),
              Text("Recommended Recipes", style: AppStyles.w500s15),
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                spacing: 13.w,
                runSpacing: 15.h,
                children: [
                  SearchDialogContainer(title: 'Ceviche'),
                  SearchDialogContainer(title: 'Hamburger'),
                  SearchDialogContainer(title: 'Egg Rolls'),
                  SearchDialogContainer(title: 'Wraps'),
                  SearchDialogContainer(title: 'Cheesecake'),
                  SearchDialogContainer(title: 'Tomatoe Soup'),
                  SearchDialogContainer(title: 'Parfait'),
                  SearchDialogContainer(title: 'Vegan'),
                  SearchDialogContainer(title: 'Baked Salmon'),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Row(
                spacing: 26.59.w,
                children: [
                  Container(
                    width: 21.w,
                    height: 21.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.pastelPink,
                    ),
                    padding: EdgeInsets.all(6.w),
                    child: SvgPicture.asset(AppSvgs.add),
                  ),
                  Text(
                    "Add Alergies",
                    style: AppStyles.w500s15,
                  ),
                ],
              ),
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: TextButtonPopular(
                  title: "Search",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  backgroundColor: AppColors.watermelonRed,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
