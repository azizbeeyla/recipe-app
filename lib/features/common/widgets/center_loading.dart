import 'package:flutter/material.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';

class CenterLoading extends StatelessWidget {
  const CenterLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: Theme.of(context).colorScheme.inversePrimary),
    );
  }
}
