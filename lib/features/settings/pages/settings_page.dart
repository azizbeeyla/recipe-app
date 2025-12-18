import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/router/routers.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/auth_repostoriy.dart';
import 'package:recipe_app_ui_kit_food/features/settings/pages/settings_modal_diolog.dart';
import 'package:recipe_app_ui_kit_food/features/settings/widgets/setting_svg.dart';

import '../../common/manegers/app_theme_view_model.dart';
import '../../common/widgets/app_bar_common.dart';
import '../../common/widgets/bottom_navigation_bar_gradient.dart';
import '../../common/widgets/bottom_navigation_bar_main.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(
        title: "Settings",
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
            SettingSvg(
              svg: AppSvgs.notification,
              title: "Notification",
              onPressed: () {
                context.push(Routers.settingNotification);
              },
            ),
            SettingSvg(
              svg: AppSvgs.admin,
              title: "Help Center",
              onPressed: () {
                context.push(Routers.settingHelpCenter);
              },
            ),
            SettingSvg(
              svg: AppSvgs.privacyPolicy,
              title: "Privacy Policy",
              onPressed: () {
                context.push(Routers.settingPrivacyPolicy);
              },
            ),
            SettingSvg(
              svg: AppSvgs.reviews,
              title: "Language",
              onPressed: () {
                context.push(Routers.settingLanguage);
              },
            ),
            SettingSvg(
              svg: AppSvgs.theme,
              title: "Turn dark Theme",
              playIcon: false,
              onPressed: () {
                context.read<AppThemeViewModel>().toggleTheme();
              },
            ),
            SettingSvg(
              svg: AppSvgs.logOut,
              title: "Log Out",
              playIcon: false,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => SettingsModalDiolog(
                    mainTitle: "End Sesion",
                    title: "Are you sure you want to log out?",
                    buttonTitle: 'Yes, End Sesion',
                    onPressed: () {
                      context.read<AuthRepository>().logout();
                    },
                  ),
                );
              },
            ),
            TextButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => SettingsModalDiolog(
                    mainTitle: "Delete account",
                    title: """Are you sure you want to delete account?""",
                    buttonTitle: 'Yes, Delet Account',
                  ),
                );
              },
              child: Text(
                "Delete Account",
                style: AppStyles.w500s15w.copyWith(color: AppColors.rosePink),
              ),
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
