import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_list.dart';

import '../../common/widgets/app_bar_common.dart';
import '../../common/widgets/bottom_navigation_bar_gradient.dart';
import '../../common/widgets/bottom_navigation_bar_main.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String selectedLang = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBarCommon(
        title: "Language",
        action: false,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(36.w, 0, 36.w, 0),
        child: ListView.builder(
          itemCount: AppList.language.length,
          itemBuilder: (context, index) {
            return RadioListTile<String>(
              value: AppList.language[index],
              groupValue: selectedLang,
              activeColor: AppColors.watermelonRed,
              fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                if (states.contains(MaterialState.selected)) {
                  return AppColors.watermelonRed;
                }
                return AppColors.watermelonRed;
              }),
              onChanged: (val) {
                setState(() {
                  selectedLang = val!;
                });
              },
              title: Text(
                AppList.language[index],
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          },
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

