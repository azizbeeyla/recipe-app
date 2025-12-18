import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/router/routers.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/text_button_popular.dart';
import 'package:recipe_app_ui_kit_food/features/logi_sign_up/manegers/login_view_model.dart';

import '../../../core/utils/app_colors.dart';
import '../../../data/models/auth_models/login_model.dart';
import '../../common/widgets/model.dart';
import '../widgets/text_field_not_pasword.dart';
import '../widgets/text_field_pasword.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordCantroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordCantroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(loginRepo: context.read()),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Login",
            style: AppStyles.w600s20wr,
          ),
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.fromLTRB(37.w, 152.h, 36.w, 70.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  spacing: 10,
                  children: [
                    TextFieldNotPasword(
                      controller: emailController,
                      text: 'Email',
                      hint: 'example@example.com',
                    ),
                    TextFieldPasword(
                      controller: passwordCantroller,
                      text: 'Password',
                      hint: 'Password',
                    ),
                  ],
                ),
                SizedBox(height: 89.h),
                Consumer<LoginViewModel>(
                  builder: (context, vm, child) => Column(
                    spacing: 27.h,
                    children: [
                      TextButtonPopular(
                        title: "Log In",
                        backgroundColor: AppColors.watermelonRed,
                        foregroundColor: Colors.white,
                        onPressed: () {
                          vm.fetchLogin(
                            authModel: LoginModel(
                              login: emailController.text,
                              password: passwordCantroller.text,
                            ),
                            onError: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Error")),
                              );
                            },
                            onSuccess: () {
                              showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (context) {
                                  return Model(
                                    title1: "Login In Successful!",
                                    title2: "Successfully logged in. ✔",
                                  );
                                },
                              );
                            },
                          );
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email yoki Password Xato!")));
                        },
                      ),
                      TextButtonPopular(
                        title: 'Sign up',
                        onPressed: () {
                          // context.read<AppThemeViewModel>().toggleTheme();
                          context.go(Routers.signUp);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 57.59.h),
                TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () {
                    context.go(Routers.forgotPassword);
                  },
                  child: Text(
                    "Forgot Password?",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                SizedBox(height: 36.h),
                Column(
                  spacing: 24.h,
                  children: [
                    Text(
                      "or sign up with",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Row(
                      spacing: 14.w,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppSvgs.instagram,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.inversePrimary,
                            BlendMode.modulate,
                          ),
                        ),
                        SvgPicture.asset(
                          AppSvgs.google,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.inversePrimary,
                            BlendMode.modulate,
                          ),
                        ),
                        SvgPicture.asset(
                          AppSvgs.facebook,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.inversePrimary,
                            BlendMode.modulate,
                          ),
                        ),
                        SvgPicture.asset(
                          AppSvgs.whatssapp,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.inversePrimary,
                            BlendMode.modulate,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Don’t have an account? Sign Up",
                      style: Theme.of(context).textTheme.titleSmall,
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
