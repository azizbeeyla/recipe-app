import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';

class ScroolConteyner extends StatelessWidget {
  const ScroolConteyner({
    super.key,
    required this.vm,
  });

  final int vm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        width: 230.w,
        height: 12,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(100),
        ),
        alignment: vm == 0
            ? Alignment.topLeft
            : vm == 1
            ? Alignment.topCenter
            : Alignment.topRight,
        child: Container(
          width: 76.66.w,
          height: 12,
          decoration: BoxDecoration(
            color: AppColors.watermelonRed,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
