import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/features/settings/widgets/build_faq_list.dart';

import '../../common/widgets/app_bar_common.dart';
import '../../common/widgets/bottom_navigation_bar_gradient.dart';
import '../../common/widgets/bottom_navigation_bar_main.dart';
import '../widgets/build_contact_list.dart';

class SettingHelpCenterPage extends StatefulWidget {
  const SettingHelpCenterPage({super.key});

  @override
  State<SettingHelpCenterPage> createState() => _SettingHelpCenterPageState();
}

class _SettingHelpCenterPageState extends State<SettingHelpCenterPage> {
  int selectedTab = 0;
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(
        title: "Help Center",
        action: false,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(37.w, 33.5.h, 37.w, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTab("FAQ", 0, 70),
                SizedBox(width: 12.w),
                _buildTab("Contact Us", 1, 45),
              ],
            ),
            SizedBox(height: 14.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCategory("General", 0),
                SizedBox(width: 8.w),
                _buildCategory("Account", 1),
                SizedBox(width: 8.w),
                _buildCategory("Services", 2),
              ],
            ),
            SizedBox(height: 14.h),
            TextField(
              style: AppStyles.w400s12wr,
              decoration: InputDecoration(
                constraints: BoxConstraints(maxHeight: 34.h),
                filled: true,
                fillColor: AppColors.pastelPink,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide.none,
                ),
                hintText: "Search",
                hintStyle: AppStyles.w400s12wr,
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: selectedTab == 0 ? BuildFaqList() : BuildContactList(),
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

  Widget _buildTab(String text, int index, double horizontal) {
    final bool active = selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => selectedTab = index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: horizontal.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: active ? AppColors.watermelonRed : AppColors.pastelPink,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Text(
          text,
          style: AppStyles.w500s15.copyWith(
            color: active ? Colors.black : AppColors.rosePink,
          ),
        ),
      ),
    );
  }

  Widget _buildCategory(String text, int index) {
    final bool active = selectedCategory == index;
    return GestureDetector(
      onTap: () => setState(() => selectedCategory = index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: active ? AppColors.watermelonRed : AppColors.pastelPink,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Text(
          text,
          style: AppStyles.w500s15w.copyWith(
            color: active ? Colors.white : AppColors.rosePink,
          ),
        ),
      ),
    );
  }
}
