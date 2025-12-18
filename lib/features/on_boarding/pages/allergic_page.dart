import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/features/on_boarding/widgets/grid_view_image.dart';

import '../../../core/router/routers.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_style.dart';
import '../../../core/utils/app_svg.dart';
import '../../common/widgets/bottom_navigation_bar_gradient.dart';
import '../../common/widgets/text_button_popular.dart';
import '../manegers/allergic_view_model.dart';
import '../widgets/scroll_conteyner.dart';

class AllergicPage extends StatelessWidget {
  const AllergicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AllergicViewModel(allergicRepo: context.read())..fetchAllergic(),
      builder: (context, child) => Scaffold(
        extendBody: true,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: SvgPicture.asset(AppSvgs.backArrow),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(15),
            child: ScroolConteyner(
              vm: 2,
            ),
          ),
        ),
        body: Consumer<AllergicViewModel>(
          builder: (context, vm, child) => vm.loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: EdgeInsets.fromLTRB(36, 55.h, 38, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 20,
                    children: [
                      Text(
                        "¿You have any allergic?",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet consectetur. Leo ornare ullamcorper viverra ultrices in.",
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 2,
                      ),
                      Expanded(
                        child: GridView.builder(
                          padding: EdgeInsets.only(bottom: 126.h),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 9.72.w,
                                mainAxisSpacing: 11.21.h,
                                mainAxisExtent: 125.49.h,
                              ),
                          itemCount: vm.allergic.length,
                          itemBuilder: (context, index) => GridViewImage(
                            vm: vm.allergic,
                            index: index,
                            defaultBorderColor: AppColors.watermelonRed,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
        bottomNavigationBar: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            BottomNavigationBarGradient(),
            Padding(
              padding: EdgeInsets.only(bottom: 34.h),
              child: TextButtonPopular(
                title: "Continue",
                backgroundColor: AppColors.watermelonRed,
                foregroundColor: Colors.white,
                onPressed: () {
                  context.go(Routers.login);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
