import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/like.dart';

class SettingSvg extends StatelessWidget {
  const SettingSvg({
    super.key,
    required this.svg,
    required this.title,
    this.playIcon = true,
    this.onPressed = _defaultOnPressed,
  });

  final String svg, title;
  final bool playIcon;
  final VoidCallback onPressed;
  static void _defaultOnPressed() {}


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 18.w,
            children: [
              Like(
                icon: svg,
                size: 35,
                backgroundFalse: AppColors.watermelonRed,
                colorFilterFalse: Colors.white,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          playIcon ? SvgPicture.asset(AppSvgs.playEmpty) : SizedBox(),
        ],
      ),
    );
  }
}
