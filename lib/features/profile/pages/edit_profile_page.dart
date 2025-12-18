import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/text_button_popular.dart';
import 'package:recipe_app_ui_kit_food/features/logi_sign_up/widgets/text_field_not_pasword.dart';

import '../../../data/models/user/profile_model.dart';
import '../../common/widgets/app_bar_common.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({
    super.key,
    required this.user,
  });

  final ProfileModel user;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final presentationController = TextEditingController();
  final linkController = TextEditingController();
  late ProfileModel profile;

  @override
  void initState() {
    super.initState();
    profile = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(
        title: "Edit Profile",
        action: false,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(36.w, 28.5.h, 36.w, 140.h),
          child: Column(
            spacing: 38.h,
            children: [
              Center(
                child: Column(
                  children: [
                    ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: profile.profilePhoto,
                        width: 97.w,
                        height: 97.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text("Edit Photo", style: AppStyles.w400s12wr),
                  ],
                ),
              ),
              Column(
                spacing: 20.h,
                children: [
                  TextFieldNotPasword(
                    controller: nameController,
                    text: "Name",
                    hint: "${profile.firstName} ${profile.lastName}",
                  ),
                  TextFieldNotPasword(
                    controller: usernameController,
                    text: "Username",
                    hint: profile.username,
                  ),
                  TextFieldNotPasword(
                    controller: presentationController,
                    text: "Presentation",
                    maxLine: 2,
                    hint: profile.presentation,
                  ),
                  TextFieldNotPasword(
                    controller: linkController,
                    text: "Add Link",
                    hint: "",
                  ),
                ],
              ),
              SizedBox(height: 50,),
              TextButtonPopular(
                title: "Save",
                width: 152,
                height: 45,
                backgroundColor: AppColors.watermelonRed,
                foregroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
