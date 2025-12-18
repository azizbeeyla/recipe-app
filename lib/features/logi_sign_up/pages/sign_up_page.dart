import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/router/routers.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/text_button_popular.dart';
import 'package:recipe_app_ui_kit_food/features/logi_sign_up/manegers/sign_up_view_model.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_svg.dart';
import '../../../data/models/auth_models/sign_up_model.dart';
import '../../common/widgets/model.dart';
import '../widgets/text_field_not_pasword.dart';
import '../widgets/text_field_pasword.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final emailCantroller = TextEditingController();
  final mobileNumberCantroller = TextEditingController();
  final dateOfBirthCantroller = TextEditingController();
  final passwordCantroller = TextEditingController();
  final confirmPasswordCantroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    lastNameController.dispose();
    firstNameController.dispose();
    emailCantroller.dispose();
    mobileNumberCantroller.dispose();
    dateOfBirthCantroller.dispose();
    passwordCantroller.dispose();
    confirmPasswordCantroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpViewModel(signRepo: context.read()),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Sign Up",
            style: AppStyles.w600s20wr,
          ),
          leading: IconButton(
            onPressed: () {
              context.go(Routers.login);
            },
            icon: SvgPicture.asset(AppSvgs.backArrow),
          ),
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: Form(
            key: formKey,
            child: Column(
              spacing: 9,
              children: [
                SizedBox(height: 90),
                TextFieldNotPasword(
                  controller: fullNameController,
                  text: 'Full name',
                  hint: 'Ism Familiya',
                ),
                TextFieldNotPasword(
                  controller: emailCantroller,
                  text: 'Email',
                  hint: 'example@example.com',
                ),
                TextFieldNotPasword(
                  controller: mobileNumberCantroller,
                  text: 'Mobile Number',
                  hint: '90 000 00 00',
                ),
                TextFieldNotPasword(
                  controller: dateOfBirthCantroller,
                  text: 'Date of birth',
                  hint: 'YYY-MM-DD',
                ),
                TextFieldPasword(
                  controller: passwordCantroller,
                  text: "password",
                  hint: "password",
                ),
                TextFieldPasword(
                  controller: confirmPasswordCantroller,
                  text: "Confirm Password",
                  hint: "Confirm Password",
                ),
                SizedBox(height: 22),
                SizedBox(
                  width: 194.w,
                  height: 35.h,
                  child: Text(
                    "By continuing, you agree to Terms of Use and Privacy Policy.",
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
                Consumer<SignUpViewModel>(
                  builder: (context, vm, child) => TextButtonPopular(
                    title: "Sign In",
                    onPressed: () async {
                      if (passwordCantroller.text ==
                          confirmPasswordCantroller.text) {
                        try {
                          String fullName = fullNameController.text.trim();

                          List<String> parts = fullName.split(" ");

                          String firstName = parts.isNotEmpty ? parts[0] : '';
                          String lastName = parts.length > 1
                              ? parts.sublist(1).join(" ")
                              : '';

                          vm.fetchSignUp(
                            authModel: SignUpModel(
                              username: fullNameController.text,
                              firstName: firstName,
                              lastName: lastName,
                              email: emailCantroller.text,
                              phoneNumber: mobileNumberCantroller.text,
                              birthDate: dateOfBirthCantroller.text,
                              password: passwordCantroller.text,
                            ),
                            onError: () {
                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(SnackBar(content: Text("Error")));
                            },
                            onSuccess: () {
                              showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (context) {
                                  return Model(
                                    title1: 'Sign up succesful!',
                                    title2:
                                        "You have successfully created an account. ✔",
                                  );
                                },
                              );
                            },
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Error: $e"),
                            ),
                          );
                          throw Exception("Error: $e");
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Password tasdiqlanmadi"),
                          ),
                        );
                      }
                    },
                    backgroundColor: AppColors.watermelonRed,
                    foregroundColor: Colors.white,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Already have an account?",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.watermelonRed,
                      ),
                      onPressed: () {
                        // context.read<AppThemeViewModel>().toggleTheme();
                        context.go(Routers.login);
                      },
                      child: Text("Log In",),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
