import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/text_button_popular.dart';
import 'package:recipe_app_ui_kit_food/features/reviews/manegers/reviews_add_view_model.dart';

import '../../../data/models/reviews_models/reviews_create_model.dart';
import 'dialogs.dart';

class AddReviews extends StatefulWidget {
  const AddReviews({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<AddReviews> createState() => _AddReviewsState();
}

class _AddReviewsState extends State<AddReviews> {
  int selectedStars = 0;
  TextEditingController commentController = TextEditingController();
  String? selected = "false";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 26.h,
      children: [
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...List.generate(5, (index) {
                    return IconButton(
                      style: IconButton.styleFrom(
                        padding: EdgeInsets.zero,
                        fixedSize: Size(28.57.w, 28.57.h),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedStars = index + 1;
                        });
                      },
                      icon: SvgPicture.asset(
                        width: 28.57.w,
                        height: 28.57.h,
                        index < selectedStars ? AppSvgs.starFilled : AppSvgs.starEmpty,
                        colorFilter: ColorFilter.mode(
                          AppColors.watermelonRed,
                          BlendMode.modulate,
                        ),
                      ),
                    );
                  }),
                ],
              ),
              Text(
                "Your overall rating",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
        TextField(
          controller: commentController,
          style: AppStyles.w500s16,
          maxLength: 120,
          maxLines: 4,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 11.w,
              vertical: 11.h,
            ),
            constraints: BoxConstraints(maxWidth: 358.w, maxHeight: 142.18.h),
            filled: true,
            fillColor: AppColors.pastelPink,
            hintText: "Leave us Review!",
            hintStyle: AppStyles.w500s15wr.copyWith(
              color: Colors.black.withValues(alpha: 0.45),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        SizedBox(
          width: 196.w,
          child: Column(
            spacing: 6.h,
            children: [
              Text(
                "Do you recommend this recipe?",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "No",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Radio<String>(
                        value: "false",
                        groupValue: selected,
                        fillColor: MaterialStateProperty.all(Colors.red),
                        onChanged: (val) {
                          setState(() {
                            selected = val;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Yes",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Radio<String>(
                        value: "true",
                        groupValue: selected,
                        fillColor: MaterialStateProperty.all(Colors.red),
                        onChanged: (val) {
                          setState(() {
                            selected = val;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButtonPopular(
              title: "cancel",
              width: 168.w,
              height: 29.h,
              style: AppStyles.w500s15wr,
            ),
            Consumer<ReviewsAddViewModel>(
              builder: (context, vm, child) => TextButtonPopular(
                title: "Submit",
                width: 168,
                height: 29,
                backgroundColor: AppColors.watermelonRed,
                style: AppStyles.w500s15w,
                onPressed: () {
                  bool recommend = false;
                  if (selected == "false") {
                    recommend = false;
                  } else {
                    recommend = true;
                  }
                  vm.fetchReviewsCreate(
                    createModel: ReviewsCreateModel(
                      recipeId: widget.id,
                      rating: selectedStars,
                      comment: commentController.text,
                      recommend: recommend,
                    ),
                    onError: () {
                      print(vm.errorm);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Error : ${vm.errorm}")),
                      );
                    },
                    onSuccess: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialogs(
                            id: widget.id,
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
