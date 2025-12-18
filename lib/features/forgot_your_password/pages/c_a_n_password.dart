import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/text_button_popular.dart';
import 'package:recipe_app_ui_kit_food/features/forgot_your_password/widgets/succes_model.dart';
import 'package:recipe_app_ui_kit_food/features/logi_sign_up/widgets/text_field_pasword.dart';

import '../widgets/forgot_your_password_texts.dart';

class CANPassword extends StatefulWidget {
  const CANPassword({super.key});

  @override
  State<CANPassword> createState() => _CANPasswordState();
}

class _CANPasswordState extends State<CANPassword> {
  final newPasswordCantroller = TextEditingController();
  final confirmPasswordCantroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    newPasswordCantroller.dispose();
    confirmPasswordCantroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        centerTitle: true,
        title: Text(
          "Create a new password",
          style: AppStyles.w600s20wr,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 51.h),
        child: Column(
          spacing: 16.h,
          children: [
            ForgotYourPasswordTexts(
              title1: "Create a new password",
              title2:
                  "Enter your new password. If you forgot it then you have,"
                  " to do the step of forgot password.",
            ),
            SizedBox(
              height: 15,
            ),
            TextFieldPasword(controller: newPasswordCantroller, text: "New Password", hint: "New Password"),
            TextFieldPasword(controller: confirmPasswordCantroller, text: "Confirm Password", hint: "Confirm Password"),
            Spacer(),
            TextButtonPopular(
              title: "continue",
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return SuccesModel(
                      title1: "!Sign up succesful!",
                      title2: "Lorem ipsum dolor sit amet pretium cras id dui pellentesque ornare.",
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
