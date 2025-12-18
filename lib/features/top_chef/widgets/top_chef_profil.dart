import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';

import '../../../data/models/user/profile_model.dart';
import '../../profile/managers/profile_following_followers_view_model.dart';

class TopChefProfil extends StatefulWidget {
  const TopChefProfil({
    super.key,
    required this.profile,
    this.active = true,
    this.isFollowing = false,
  });

  final ProfileModel profile;
  final bool active;
  final bool isFollowing;

  @override
  State<TopChefProfil> createState() => _TopChefProfilState();
}

class _TopChefProfilState extends State<TopChefProfil> {
  late bool tap;

  @override
  void initState() {
    super.initState();
    tap = widget.isFollowing;
  }

  @override
  void didUpdateWidget(covariant TopChefProfil oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isFollowing != widget.isFollowing) {
      tap = widget.isFollowing;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 97.h,
      child: Row(
        spacing: 13.w,
        children: [
          ClipOval(
            child: CachedNetworkImage(
              imageUrl: widget.profile.profilePhoto,
              width: 102.w,
              height: 97.h,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            spacing: 5.5.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.profile.firstName} ${widget.profile.lastName}-chef",
                style: AppStyles.w500s15wr,
              ),
              Text(
                widget.profile.presentation,
                style: Theme.of(context).textTheme.titleSmall,
                maxLines: 2,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.pastelPink,
                  foregroundColor: AppColors.watermelonRed,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 2,
                  ),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  minimumSize: const Size(0, 0),
                ),
                onPressed: () {
                  if (tap) {
                    context
                        .read<ProfileFollowingFollowersViewModel>()
                        .fetchUnfollow(id: widget.profile.id);
                  } else {
                    context
                        .read<ProfileFollowingFollowersViewModel>()
                        .fetchFollow(id: widget.profile.id);
                  }
                  setState(() {
                    tap = !tap;
                  });
                },
                child: Text(
                  tap ? "Unfollow" : "Follow",
                  style: AppStyles.w500s8,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

