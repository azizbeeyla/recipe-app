import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/features/profile/widgets/user_profile_widget.dart';

import '../../settings/widgets/notification_switch.dart';

class UserNotifications extends StatelessWidget {
  const UserNotifications({
    super.key,
    required this.widget,
  });

  final UserProfileWidget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 253.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(50.r),
        ),
      ),
      padding: EdgeInsets.fromLTRB(56.w, 45.h, 56.w, 65.h),
      child: Column(
        spacing: 17.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 15.w,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipOval(
                child: CachedNetworkImage(
                  imageUrl: widget.followers[widget.index].profilePhoto,
                  width: 64.w,
                  height: 63.h,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                "@ ${widget.followers[widget.index].username}",
                style: AppStyles.w500s15wr,
              ),
            ],
          ),
          Column(
            spacing: 17.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      width: double.infinity,
                      height: 333.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(50.r)),
                      ),
                      padding: EdgeInsets.fromLTRB(56.w, 45.h, 56.w, 65.h),
                      child: Column(
                        spacing: 17.h,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 15.w,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl: widget.followers[widget.index].profilePhoto,
                                  width: 64.w,
                                  height: 63.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                "@ ${widget.followers[widget.index].username}",
                                style: AppStyles.w500s15wr,
                              ),
                            ],
                          ),
                          Column(
                            spacing: 7.h,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Manage notifications",style: AppStyles.w600s20.copyWith(color: AppColors.backgroundColor),),
                              NotificationSwitch(title: "Notifications",theme: false,),
                              NotificationSwitch(title: "Block Account",theme: false,),
                              Text("Report",style: AppStyles.w500s15),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                child: Text(
                  "Manage notifications",
                  style: AppStyles.w400s13.copyWith(
                    fontSize: 15,
                  ),
                ),
              ),
              GestureDetector(
                onTap:(){
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      width: double.infinity,
                      height: 265.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(50.r)),
                      ),
                      padding: EdgeInsets.fromLTRB(56.w, 45.h, 56.w, 65.h),
                      child: Column(
                        spacing: 17.h,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 15.w,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl: widget.followers[widget.index].profilePhoto,
                                  width: 64.w,
                                  height: 63.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                "@ ${widget.followers[widget.index].username}",
                                style: AppStyles.w500s15wr,
                              ),
                            ],
                          ),
                          Column(
                            spacing: 7.h,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Mute notifications",style: AppStyles.w600s20.copyWith(color: AppColors.backgroundColor),),
                              NotificationSwitch(title: "Publications",theme: false,),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                child: Text(
                  "Mute notifications",
                  style: AppStyles.w400s13.copyWith(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
