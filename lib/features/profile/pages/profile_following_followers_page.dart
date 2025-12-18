import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/app_bar_common.dart';
import 'package:recipe_app_ui_kit_food/features/profile/managers/profile_following_followers_view_model.dart';
import 'package:recipe_app_ui_kit_food/features/profile/widgets/user_profile_widget.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_style.dart';
import '../../../data/models/user/profile_model.dart';
import '../../../data/repositores/user_repositores/user_repository.dart';

class ProfileFollowingFollowersPage extends StatefulWidget {
  const ProfileFollowingFollowersPage({super.key, required this.user});

  final ProfileModel user;

  @override
  State<ProfileFollowingFollowersPage> createState() => _ProfileFollowingFollowersPageState();
}

class _ProfileFollowingFollowersPageState extends State<ProfileFollowingFollowersPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBarCommon(
          title: "@${widget.user.username}",
          onPressed: () async {
            context.read<UsersRepository>().getTopChefFollowings(
              ignoreCacheFollow: true,
              id: widget.user.id,
            );
            context.read<UsersRepository>().getTopChefFollowers(
              ignoreCacheFollow: true,
              id: widget.user.id,
            );
            context.pop();
          },
          action: false,
          titleCenter: false,
        ),
        body: ChangeNotifierProvider(
          create: (context) => ProfileFollowingFollowersViewModel(userRepo: context.read(), id: widget.user.id),
          builder: (context, child) => Padding(
            padding: EdgeInsets.fromLTRB(37.w, 14.h, 36.w, 126.h),
            child: Column(
              spacing: 15.h,
              children: [
                Consumer<ProfileFollowingFollowersViewModel>(
                  builder: (context, vm, child) => TabBar(
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(width: 3, color: Colors.red),
                      insets: EdgeInsets.symmetric(horizontal: -50),
                    ),
                    dividerColor: Colors.transparent,
                    tabs: [
                      Tab(
                        child: Text(
                          "${vm.folowers.length} Folowers",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      Tab(
                        child: Text(
                          "${vm.followings.length} Following",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
                TextField(
                  style: AppStyles.w400s12wr,
                  decoration: InputDecoration(
                    constraints: BoxConstraints(maxHeight: 34.h),
                    filled: true,
                    fillColor: AppColors.pastelPink,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Search",
                    hintStyle: AppStyles.w400s12wr,
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Consumer<ProfileFollowingFollowersViewModel>(
                        builder: (context, vm, child) => RefreshIndicator(
                          onRefresh: () async {
                            setState(() {});
                          },
                          child: ListView.builder(
                            itemCount: vm.folowers.length,
                            itemBuilder: (context, index) => UserProfileWidget(
                              followers: vm.folowers,
                              index: index,
                              active: false,
                              isFollowing: vm.followings.any((user) => user.id == vm.folowers[index].id,
                            ),
                          ),
                        ),
                      ),),
                      Consumer<ProfileFollowingFollowersViewModel>(
                        builder: (context, vm, child) => RefreshIndicator(
                          onRefresh: () async {
                            setState(() {});
                          },
                          child: ListView.builder(
                            itemCount: vm.followings.length,
                            itemBuilder: (context, index) => UserProfileWidget(
                              followers: vm.followings,
                              index: index,
                            ),
                          ),
                        ),
                      ),
  ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
