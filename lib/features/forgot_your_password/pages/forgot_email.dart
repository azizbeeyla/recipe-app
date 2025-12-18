import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app_ui_kit_food/core/router/routers.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/text_button_popular.dart';
import 'package:recipe_app_ui_kit_food/features/forgot_your_password/widgets/forgot_your_password_texts.dart';
import 'package:recipe_app_ui_kit_food/features/logi_sign_up/widgets/text_field_not_pasword.dart';

class ForgotEmail extends StatefulWidget {
  const ForgotEmail({super.key});

  @override
  State<ForgotEmail> createState() => _ForgotEmailState();
}

class _ForgotEmailState extends State<ForgotEmail> {
  final emailCantroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailCantroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        centerTitle: true,
        title: Text(
          "Forgot your password",
          style: AppStyles.w600s20wr,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 51.h),
        child: Column(
          spacing: 43.h,
          children: [
            ForgotYourPasswordTexts(
              title1: "Hello there!",
              title2: "Enter your email address. We will send a code verification in the next step.",
            ),
            TextFieldNotPasword(
              controller: emailCantroller,
              text: "Email",
              hint: "example@example.com",
            ),
            Spacer(),
            TextButtonPopular(
              title: "continue",
              onPressed: () {
                context.go(Routers.otpScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
