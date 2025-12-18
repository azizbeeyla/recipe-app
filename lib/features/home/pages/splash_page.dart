import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';

import '../../../core/router/routers.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_style.dart';
import '../../../core/utils/app_svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    final FlutterSecureStorage secureStorage = FlutterSecureStorage();
    secureStorage.read(key: "token").then(
      (value) {
        if (value != null) {
          Future.delayed(Duration(seconds: 3), () {
            context.go(Routers.home);
          });
        } else {
          Future.delayed(Duration(seconds: 3), () {
            context.go(Routers.onboarding);
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.watermelonRed,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 152.67.w,
              height: 152.67.h,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 12.78,
                children: [
                  SvgPicture.asset(AppSvgs.pichoq),
                  SvgPicture.asset(AppSvgs.vilka),
                ],
              ),
            ),
            Text("DishDash", style: AppStyles.w600s64),
          ],
        ),
      ),
    );
  }
}
