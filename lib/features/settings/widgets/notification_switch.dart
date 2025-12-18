import 'package:flutter/material.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';

import '../../../core/utils/app_colors.dart';

class NotificationSwitch extends StatefulWidget {
  const NotificationSwitch({
    super.key,
    required this.title,
    this.theme = true,
  });

  final String title;
  final bool theme;

  @override
  State<NotificationSwitch> createState() => _NotificationSwitchState();
}

class _NotificationSwitchState extends State<NotificationSwitch> {
  bool svitch = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: widget.theme ? Theme.of(context).textTheme.bodyMedium : AppStyles.w500s15,
        ),
        Transform.scale(
          scale: 0.75,
          child: Switch(
            value: svitch,
            onChanged: (bool value) {
              setState(() {
                svitch = value;
              });
            },
            activeColor: Colors.white,
            activeTrackColor: AppColors.watermelonRed,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: AppColors.watermelonRed,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
      ],
    );
  }
}
