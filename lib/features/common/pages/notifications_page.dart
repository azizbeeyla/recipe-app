import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/notifications_email.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/app_bar_common.dart';

import '../widgets/bottom_navigation_bar_gradient.dart';
import '../widgets/bottom_navigation_bar_main.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBarCommon(
        title: "Notifications",
        action: false,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(37.w, 33.h, 37.w, 126.h),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 15.h,
                children: [
                  Text("Bugun"),
                  ...List.generate(2, (index) {
                    return NotificationsEmail(
                      svg: AppSvgs.star,
                      title: "35 Min Ago",
                    );
                  }),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 15.h,
                children: [
                  Text("Kecha"),
                  ...List.generate(3, (index) {
                    return NotificationsEmail(
                      svg: AppSvgs.notificationBell,
                      title: "25 April 2024",
                    );
                  }),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 15.h,
                children: [
                  Text("Eski"),
                  ...List.generate(5, (index) {
                    return NotificationsEmail(
                      svg: AppSvgs.star,
                      title: "20 April 2024",
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          BottomNavigationBarGradient(),
          BottomNavigationBarMain(),
        ],
      ),
    );
  }
}
