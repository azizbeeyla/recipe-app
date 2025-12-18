import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/app_bar_common.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/top_chef_follow.dart';
import 'package:recipe_app_ui_kit_food/features/profile/managers/profile_following_followers_view_model.dart';
import 'package:recipe_app_ui_kit_food/features/top_chef/manegers/top_chef_detail_view_model.dart';
import 'package:recipe_app_ui_kit_food/features/top_chef/widgets/top_chef_modal.dart';
import 'package:recipe_app_ui_kit_food/features/top_chef/widgets/top_chef_profil.dart';

import '../../common/widgets/bottom_navigation_bar_gradient.dart';
import '../../common/widgets/bottom_navigation_bar_main.dart';
import '../../common/widgets/recipe_image_over.dart';
import '../../recipe/manegers/recipe_list_view_model.dart';
import '../../settings/widgets/notification_switch.dart';

class TopChefDetailPage extends StatelessWidget {
  const TopChefDetailPage({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TopChefDetailViewModel(repository: context.read(), id: id),
      builder: (context, child) => Consumer<TopChefDetailViewModel>(
        builder: (context, vm, child) => vm.loading
            ? Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
                extendBody: true,
                appBar: AppBarCommon(
                  title: "@${vm.chefDetail.username}",
                  oneButtom: AppSvgs.share,
                  twoButtom: AppSvgs.threeDots,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  oneOnPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        height: 373.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(50.r),
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(56.w, 45.h, 56.w, 65.h),
                        child: Column(
                          spacing: 15.h,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 15.w,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: vm.chefDetail.profilePhoto,
                                    width: 64.w,
                                    height: 63.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  "@ ${vm.chefDetail.username}",
                                  style: AppStyles.w500s15wr,
                                ),
                              ],
                            ),
                            Column(
                              spacing: 5.h,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Manage notifications",
                                  style: AppStyles.w600s20.copyWith(
                                    color: AppColors.backgroundColor,
                                  ),
                                ),
                                NotificationSwitch(title: "Mute notifications", theme: false),
                                NotificationSwitch(title: "Mute Account", theme: false),
                                NotificationSwitch(title: "Block Account", theme: false),
                                Text(
                                  "Report",
                                  style: AppStyles.w400s13.copyWith(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  twoOnPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => TopChefModal(
                        vm: vm.chefDetail,
                      ),
                    );
                  },
                ),
                body: ChangeNotifierProvider(
                  create: (context) => CategoriesViewModel(
                    categoryId: 5,
                    recipeRepo: context.read(),
                  ),
                  builder: (context, child) => Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(37.w, 28.h, 37.w, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 12.71.h,
                          children: [
                            ChangeNotifierProvider(
                              create: (context) => ProfileFollowingFollowersViewModel(
                                userRepo: context.read(),
                                id: vm.chefDetail.id,
                              ),
                              child: Consumer<ProfileFollowingFollowersViewModel>(
                                builder: (context, follow, child) => TopChefProfil(
                                  profile: vm.chefDetail,
                                  isFollowing: follow.followings.any((f) => f.id == vm.chefDetail.id),
                                ),
                              ),
                            ),
                            TopChefFollow(
                              vm: vm.chefDetail,
                            ),
                            Text(
                              "Recipes",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Divider(
                              color: AppColors.watermelonRed,
                            ),
                          ],
                        ),
                      ),
                      Consumer<CategoriesViewModel>(
                        builder: (context, vmd, child) => Expanded(
                          child: GridView.builder(
                            padding: EdgeInsets.fromLTRB(
                              37.w,
                              19.h,
                              37.w,
                              126.h,
                            ),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 19.w,
                              mainAxisSpacing: 30.h,
                              mainAxisExtent: 226.h,
                            ),
                            itemCount: vmd.recipes.length,
                            itemBuilder: (context, index) {
                              return RecipeImageOver(
                                vm: vmd.recipes,
                                index: index,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    BottomNavigationBarGradient(),
                    BottomNavigationBarMain(),
                  ],
                ),
              ),
      ),
    );
  }
}
