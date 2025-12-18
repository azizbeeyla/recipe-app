import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app_ui_kit_food/core/router/routers.dart';

import '../../../data/models/category_models/category_model.dart';

class CategoriyDetail extends StatelessWidget {
  const CategoriyDetail({
    super.key,
    required this.categoriy,
  });

  final CategoryModel categoriy;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          Routers.recipeListPage,
          extra: {
            "appBarTitle": categoriy.title,
            "categoryId": categoriy.id,
          },
        );
      },
      child: Column(
        spacing: 6.h,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.61.r),
            child: CachedNetworkImage(
              imageUrl: categoriy.image,
              width: 158.54.w,
              height: 144.53.h,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            categoriy.title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
