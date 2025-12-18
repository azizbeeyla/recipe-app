import 'package:hive/hive.dart';
import 'package:recipe_app_ui_kit_food/data/models/category_models/category_model.dart';

class CategoryRepositoryLocal {
  final _box = Hive.box<CategoryModel>('category');

  Future<List<CategoryModel>> getCategoryRepo() async {
    return _box.values.toList();
  }

  Future<void> save(List<CategoryModel> categories) async {
    await _box.clear();
    await _box.addAll(categories);
  }
}

