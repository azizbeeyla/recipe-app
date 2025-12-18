import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/hive_service.dart';
import 'package:recipe_app_ui_kit_food/core/router/router.dart';
import 'package:recipe_app_ui_kit_food/core/utils/themes.dart';

import 'core/dependencies.dart';
import 'features/common/manegers/app_theme_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveStorage();
  runApp(MyRecipe());
}

class MyRecipe extends StatelessWidget {
  MyRecipe({super.key});

  final themes = AppThemes();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      child: MultiProvider(
        providers: dependencies,
        builder: (context, child) => MaterialApp.router(
          theme: themes.lightTheme,
          darkTheme: themes.darkTheme,
          themeMode: context.watch<AppThemeViewModel>().mode,
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        ),
      ),
    );
  }
}
