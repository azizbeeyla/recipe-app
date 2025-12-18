import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/features/on_boarding/manegers/on_boarding_view_model.dart';

import '../../../core/router/routers.dart';
import '../../common/widgets/bottom_navigation_bar_gradient.dart';
import '../../common/widgets/text_button_popular.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnBoardingViewModel(onBoardingRepo: context.read())..fetchOnBoarding(),
      builder: (context, child) => Scaffold(
        extendBody: true,
        appBar: AppBar(),
        body: Consumer<OnBoardingViewModel>(
          builder: (context, vm, child) => vm.loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : PageView(
                  children: [
                    ...List.generate(vm.onBoarding.length, (index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 37.w,
                            ),
                            child: Column(
                              spacing: 14.w,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  vm.onBoarding[index].title,
                                  style: Theme.of(context).textTheme.displayMedium,
                                  maxLines: 1,
                                ),
                                Text(
                                  vm.onBoarding[index].subtitle,
                                  style: Theme.of(context).textTheme.titleMedium,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            width: 430.w,
                            height: 741.3.h,
                            child: Stack(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: vm.onBoarding[index].image,
                                  width: 430.w,
                                  height: 720.04.h,
                                  fit: BoxFit.cover,
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    width: 430.w,
                                    height: 284.h,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Theme.of(context).colorScheme.onInverseSurface,
                                          Colors.transparent,
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              BottomNavigationBarGradient(),
              Padding(
                padding: EdgeInsets.only(bottom: 14.h),
                child: TextButtonPopular(
                  title: "Continue",
                  backgroundColor: AppColors.watermelonRed,
                  foregroundColor: Colors.white,
                  onPressed: () {
                    // context.read<AppThemeViewModel>().toggleTheme();
                    context.push(Routers.welcome, extra: {});
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
