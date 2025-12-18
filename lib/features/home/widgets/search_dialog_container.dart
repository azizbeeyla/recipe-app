import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';

class SearchDialogContainer extends StatefulWidget {
  const SearchDialogContainer({
    super.key,
    required this.title,
    this.horizontal = 18,
    this.onPressed = _defaultOnPressed,
    this.isActiv = true,
  });

  final String title;
  final double horizontal;
  final bool isActiv;
  final VoidCallback onPressed;

  static void _defaultOnPressed() {}

  @override
  State<SearchDialogContainer> createState() => _SearchDialogContainerState();
}

class _SearchDialogContainerState extends State<SearchDialogContainer> {
  bool ontap = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isActiv
          ? () {
              ontap = !ontap;
              setState(() {});
            }
          : widget.onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: ontap ? AppColors.watermelonRed : AppColors.pastelPink,
          borderRadius: BorderRadius.circular(30.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: widget.horizontal.w, vertical: 2.h),
        child: Text(
          widget.title,
          style: AppStyles.w500s15w.copyWith(color: ontap ? Colors.white : AppColors.rosePink),
        ),
      ),
    );
  }
}
