import 'package:recipe_app_ui_kit_food/core/utils/result.dart';

import '../models/category_models/category_model.dart';

abstract interface class ICategoryRepositories {
  Future<Result<List<CategoryModel>>> getCategory();
}
