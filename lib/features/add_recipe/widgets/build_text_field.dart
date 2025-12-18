import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';

class buildTextField extends StatelessWidget {
  const buildTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.maxWidth = 224.25,
  });

  final TextEditingController controller;
  final String hint;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        controller: controller,
        style: AppStyles.w500s13,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppStyles.w500s13,
          filled: true,
          fillColor: AppColors.pastelPink,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(19.r),
            borderSide: BorderSide.none
          ),
          constraints: BoxConstraints(
            maxWidth: maxWidth.w,
          ),
        ),
      ),
    );
  }
}
