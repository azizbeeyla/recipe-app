import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';

class Like extends StatefulWidget {
  const Like({
    super.key,
    this.icon = AppSvgs.like,
    this.size = 28,
    this.backgroundFalse = AppColors.pastelPink,
    this.backgroundTrue = AppColors.watermelonRed,
    this.colorFilterFalse = AppColors.rosePink,
    this.colorFilterTrue = Colors.white,
  });

  final String icon;
  final double size;
  final Color backgroundFalse, backgroundTrue, colorFilterFalse, colorFilterTrue;

  @override
  State<Like> createState() => _LikeState();
}

class _LikeState extends State<Like> {
  bool like = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.w,
      height: widget.size.h,
      child: IconButton(
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        style: IconButton.styleFrom(
          backgroundColor: like ? widget.backgroundTrue : widget.backgroundFalse,
        ),
        onPressed: () {
          like = !like;
          setState(() {});
        },
        icon: SvgPicture.asset(
          widget.icon,
          width: 12.5.w,
          height: 18.75.h,
          colorFilter: ColorFilter.mode(
            like ? widget.colorFilterTrue : widget.colorFilterFalse,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
