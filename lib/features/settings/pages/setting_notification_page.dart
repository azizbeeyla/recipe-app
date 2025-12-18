import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_ui_kit_food/features/settings/widgets/notification_switch.dart';

import '../../common/widgets/app_bar_common.dart';
import '../../common/widgets/bottom_navigation_bar_gradient.dart';
import '../../common/widgets/bottom_navigation_bar_main.dart';

class SettingNotificationPage extends StatefulWidget {
  const SettingNotificationPage({super.key});

  @override
  State<SettingNotificationPage> createState() => _SettingNotificationPageState();
}

class _SettingNotificationPageState extends State<SettingNotificationPage> {
  bool switch1 = false, switch2 = false, switch3 = false, switch4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(
        title: "Notification",
        action: false,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(36.w, 33.5.h, 36.w, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15.h,
          children: [
            NotificationSwitch(title: "General Notification",),
            NotificationSwitch(title: "Sound",),
            NotificationSwitch(title: "Sound Call",),
            NotificationSwitch(title: "Vibrate",),
          ],
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
