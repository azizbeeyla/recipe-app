import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_svg.dart';


class TextFieldPasword extends StatefulWidget {
  const TextFieldPasword({
    super.key,
    required this.controller,
    required this.text,
    required this.hint,
  });

  final TextEditingController controller;
  final String text, hint;

  @override
  State<TextFieldPasword> createState() => _TextFieldPaswordState();
}

class _TextFieldPaswordState extends State<TextFieldPasword> {
  bool passw = false;

  @override
  Widget build(BuildContext _context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        TextField(
          obscureText: passw,
          style: AppStyles.w500s16,
          controller: widget.controller,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 36.w),
            constraints: BoxConstraints(
              minWidth: 357.w,
              maxWidth: 357.w,
            ),
            filled: true,
            fillColor: AppColors.pastelPink,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            hintText: widget.hint,
            hintStyle: AppStyles.w500s16,
            suffixIcon: IconButton(
              onPressed: () {
                passw = !passw;
                setState(() {});
              },
              icon: passw
                  ? Icon(Icons.remove_red_eye_outlined)
                  : SvgPicture.asset(AppSvgs.password),
            ),
          ),
        ),
      ],
    );
  }
}
