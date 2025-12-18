import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_list.dart';
import '../../../core/utils/app_svg.dart';

class BuildContactList extends StatelessWidget {
  const BuildContactList({super.key});

  @override
  Widget build(BuildContext context) {
    final svgs = [
      AppSvgs.website,
      AppSvgs.facebook,
      AppSvgs.whatssapp,
      AppSvgs.instagram,
    ];
    return ListView.separated(
      itemCount: AppList.contacts.length,
      separatorBuilder: (_, __) => SizedBox(height: 12.h),
      itemBuilder: (_, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: AppColors.watermelonRed,
            child: SvgPicture.asset(svgs[index]),
          ),
          title: Text(
            AppList.contacts[index],
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing: SvgPicture.asset(AppSvgs.playEmpty),
        );
      },
    );
  }
}
