import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../core/utils/app_list.dart';


class CookingLevelText extends StatefulWidget {
  const CookingLevelText({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<CookingLevelText> createState() => _CookingLevelTextState();
}

class _CookingLevelTextState extends State<CookingLevelText> {
  bool buttom = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        buttom = !buttom;
        setState(() {});
      },
      child: Container(
        width: 356.w,
        height: 116.h,
        padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: buttom ? AppColors.watermelonRed : AppColors.pastelPink,
            width: 0.98,
          ),
        ),
        child: SizedBox(
          width: 322.w,
          height: 92.h,
          child: Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppList.cookingLevel[widget.index]["level"],
                style: Theme.of(context).textTheme.bodyMedium
              ),
              Text(
                AppList.cookingLevel[widget.index]["title"],
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}