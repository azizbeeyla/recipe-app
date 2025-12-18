import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/app_svg.dart';

class BuildFaqList extends StatelessWidget {
  const BuildFaqList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 8,
      separatorBuilder: (_, __) => SizedBox(height: 12.h),
      itemBuilder: (_, index) {
        return ListTile(
          title: Text(
            "Lorem ipsum dolor sit amet?",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing: SvgPicture.asset(AppSvgs.playEmpty),
        );
      },
    );
  }
}
