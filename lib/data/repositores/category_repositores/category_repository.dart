import 'package:recipe_app_ui_kit_food/data/interfaces/category_repocitories_interfaces.dart';

import '../../../core/utils/result.dart';
import '../../models/category_models/category_model.dart';
import 'category_repository_local.dart';
import 'category_repository_remote.dart';

class CategoryRepository implements ICategoryRepositories{
  CategoryRepository({
    required CategoryRepositoryLocal localRepo,
    required CategoryRepositoryRemote remoteRepo,
  }) : _localRepo = localRepo,
       _remoteRepo = remoteRepo;
  final CategoryRepositoryLocal _localRepo;
  final CategoryRepositoryRemote _remoteRepo;
  final bool ignoreCache = false;

  @override
  Future<Result<List<CategoryModel>>> getCategory() async {
    if (!ignoreCache) {
      final cachedCategories = await _localRepo.getCategoryRepo();
      if (cachedCategories.isNotEmpty) {
        return Result.ok(cachedCategories);
      }
    }

    final result = await _remoteRepo.getCategoryRepo();

    return result.fold(
      (error) => Result.error(error),
      (value) async {
        await _localRepo.save(value);
        return Result.ok(value);
      },
    );
  }
}
