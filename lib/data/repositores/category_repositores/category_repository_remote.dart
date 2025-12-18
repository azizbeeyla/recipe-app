import 'package:recipe_app_ui_kit_food/data/models/category_models/category_model.dart';

import '../../../core/client.dart';
import '../../../core/utils/result.dart';

class CategoryRepositoryRemote {
  CategoryRepositoryRemote({
    required ApiClient client,
  }) : _client = client;
  final ApiClient _client;

  Future<Result<List<CategoryModel>>> getCategoryRepo() async {
    var response = await _client.get<List>('/categories/list');

    return response.fold(
          (error) => Result.error(error),
          (value) {
        return Result.ok(value.map((x) => CategoryModel.fromJson(x)).toList());
      },
    );
  }
}
