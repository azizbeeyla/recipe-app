import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';

class TextFieldNotPasword extends StatelessWidget {
  const TextFieldNotPasword({
    super.key,
    required this.controller,
    required this.text,
    required this.hint,
    this.maxLine = 1,
  });

  final TextEditingController controller;
  final String text, hint;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        TextField(
          controller: controller,
          style: AppStyles.w500s16,
          maxLines: maxLine,
          cursorColor: AppColors.backgroundColor,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 12.h),
            constraints: BoxConstraints(
              minWidth: 357.w,
              maxWidth: 357.w,
            ),
            filled: true,
            fillColor: AppColors.pastelPink,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: BorderSide.none,
            ),
            hintText: hint,
            hintStyle: AppStyles.w500s16.copyWith(color: AppColors.backgroundColor.withValues(alpha: 0.5)),
          ),
        ),
      ],
    );
  }
}
