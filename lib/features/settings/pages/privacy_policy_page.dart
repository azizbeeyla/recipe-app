import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_list.dart';

import '../../common/widgets/app_bar_common.dart';
import '../../common/widgets/bottom_navigation_bar_gradient.dart';
import '../../common/widgets/bottom_navigation_bar_main.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(
        title: "Privacy Policy",
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
            Text(
              "Est fugiat assumenda aut reprehenderit",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              AppList.privacyPolicy,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.justify,
            ),
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
