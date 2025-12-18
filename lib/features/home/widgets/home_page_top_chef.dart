import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/router/routers.dart';

import '../../../core/utils/app_style.dart';
import '../manegers/home_view_model.dart';

class HomePageTopChef extends StatelessWidget {
  const HomePageTopChef({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.h,
      children: [
        Text(
          "Top Chef",
          style: AppStyles.w500s15wr,
        ),
        Consumer<HomeViewModel>(
          builder: (context, vm, child) => vm.topChefLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(vm.topChef.length, (index) {
                      return GestureDetector(
                        onTap: (){
                          context.push(Routers.topChefs);
                        },
                        child: Column(
                          spacing: 2,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6.77.r),
                              child: CachedNetworkImage(
                                imageUrl: vm.topChef[index].profilePhoto,
                                width: 82.69.w,
                                height: 74.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              vm.topChef[index].firstName,
                              style: Theme.of(context).textTheme.titleLarge
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
        ),
      ],
    );
  }
}
