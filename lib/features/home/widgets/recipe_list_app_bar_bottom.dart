import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../manegers/home_view_model.dart';

final controller = ScrollController();

class RecipeListAppBarBottom extends StatefulWidget
    implements PreferredSizeWidget {
  const RecipeListAppBarBottom({
    super.key,
  });

  @override
  State<RecipeListAppBarBottom> createState() => _RecipeListAppBarBottomState();

  @override
  Size get preferredSize => Size(double.infinity, 39.h);
}

class _RecipeListAppBarBottomState extends State<RecipeListAppBarBottom> {
  int activIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, vm, child) {
        return vm.categoryLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                controller: controller,
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 7.h,
                  ),
                  child: Row(
                    spacing: 19.w,
                    children: [
                      ...List.generate(
                        vm.categoriy.length,
                        (index) => GestureDetector(
                          onTap: () {
                            activIndex = index;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "${vm.categoriy[index].title} bosildi",
                                ),
                              ),
                            );
                            setState(() {});
                          },
                          child: Container(
                            height: 25.h,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 9.w),
                            decoration: BoxDecoration(
                              color: activIndex == index
                                  ? AppColors.watermelonRed
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(18.r),
                            ),
                            child: Text(
                              vm.categoriy[index].title,
                              style: TextStyle(
                                color: activIndex == index
                                    ? AppColors.white
                                    : AppColors.watermelonRed,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
