import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:recipe_app_ui_kit_food/core/router/routers.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';

import '../../../core/utils/app_style.dart';
import '../widgets/forgot_your_password_texts.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String kod = "";
  int vaqt = 60;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (vaqt > 0) {
        setState(() => vaqt--);
      } else {
        t.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool toliq = kod.length == 6;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          "Forgot Your Password",
          style: AppStyles.w600s20wr,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(37.w, 53.h, 37.w, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 53.h,
            children: [
              ForgotYourPasswordTexts(
                title1: "You've Got Mail",
                title2: "We will send you the verification code to your email address, "
                    "check your email and put the code right below.",
              ),
              PinCodeTextField(
                appContext: context,
                length: 6,
                onChanged: (val) => setState(() => kod = val),
                autoFocus: true,
                keyboardType: TextInputType.number,
                cursorColor: Colors.white,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.circle,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 38.78.w,
                  fieldWidth: 38.78.h,
                  activeColor: AppColors.watermelonRed,
                  selectedColor: AppColors.rosePink,
                  inactiveColor: AppColors.watermelonRed,
                  activeFillColor: Colors.transparent,
                  selectedFillColor: Colors.transparent,
                  inactiveFillColor: Colors.transparent,
                ),
                textStyle: AppStyles.w600s17w,
              ),
              SizedBox(height: 23.22),
              Text(
                vaqt > 0 ? "Didn't receive the mail?\nYou can resend it in $vaqt sec" : "You can resend now",
                textAlign: TextAlign.center,
                style: AppStyles.w400s13w,
              ),
              Spacer(),
              ElevatedButton(
                onPressed: toliq
                    ? () => context.go(Routers.canPassword)
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.pastelPink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  fixedSize: Size(207.w, 45.h),
                  padding: EdgeInsets.symmetric(horizontal: 55.w),
                ),
                child: Text(
                  "Continue",
                  style: AppStyles.w600s20wr,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
