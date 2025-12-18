import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';
import 'package:recipe_app_ui_kit_food/data/models/top_chef_models/top_chef_model.dart';
import 'package:recipe_app_ui_kit_food/features/profile/widgets/user_notifications.dart';

import '../managers/profile_following_followers_view_model.dart';

class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget({
    super.key,
    required this.followers,
    required this.index,
    this.active = true,
    this.isFollowing = false,
  });

  final List<TopChefModel> followers;
  final int index;
  final bool active;
  final bool isFollowing;

  @override
  State<UserProfileWidget> createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  bool tap = true, delete = true;

  @override
  void initState() {
    tap = widget.isFollowing;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => UserNotifications(widget: widget),
        );
      },
      child: Column(
        children: [
          Row(
            spacing: 15,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(31.5),
                child: CachedNetworkImage(
                  imageUrl: widget.followers[widget.index].profilePhoto,
                  width: 61.w,
                  height: 63.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 115.87.w,
                height: 33.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "@${widget.followers[widget.index].username}",
                      style: AppStyles.w400s12wr,
                    ),
                    Text(
                      "${widget.followers[widget.index].firstName} ${widget.followers[widget.index].lastName}-chef",
                      style: Theme.of(context).textTheme.titleSmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              widget.active
                  ? Row(
                      spacing: 9,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.read<ProfileFollowingFollowersViewModel>().fetchUnfollow(
                              id: widget.followers[widget.index].id,
                            );
                            tap = !tap;
                            setState(() {});
                          },
                          child: Container(
                            width: 109.09.w,
                            height: 21.h,
                            decoration: BoxDecoration(
                              color: AppColors.pastelPink,
                              borderRadius: BorderRadius.circular(22.r),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              tap ? "Follow" : "Unfollow",
                              style: AppStyles.w500s15w.copyWith(
                                color: AppColors.rosePink,
                              ),
                            ),
                          ),
                        ),
                        SvgPicture.asset(AppSvgs.threeDots),
                      ],
                    )
                  : Row(
                      spacing: 9,
                      children: [
                        GestureDetector(
                          onTap: () {
                            tap
                                ? context.read<ProfileFollowingFollowersViewModel>().fetchUnfollow(
                                    id: widget.followers[widget.index].id,
                                  )
                                : context.read<ProfileFollowingFollowersViewModel>().fetchFollow(
                                    id: widget.followers[widget.index].id,
                                  );
                            tap = !tap;
                            setState(() {});
                          },
                          child: Container(
                            width: 65.w,
                            height: 18.h,
                            alignment: Alignment.center,
                            child: Text(
                              tap ? "Unfollow" : "Follow",
                              style: AppStyles.w500s15wr,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<ProfileFollowingFollowersViewModel>().fetchRemoveFollow(
                              id: widget.followers[widget.index].id,
                            );
                            delete = !delete;
                            setState(() {});
                          },
                          child: Container(
                            width: 69.13.w,
                            height: 21.h,
                            decoration: BoxDecoration(
                              color: AppColors.pastelPink,
                              borderRadius: BorderRadius.circular(22.r),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              delete ? "Delete" : "Succes",
                              style: AppStyles.w500s15w.copyWith(
                                color: AppColors.rosePink,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
          SizedBox(height: 15.h),
        ],
      ),
    );
  }
}
