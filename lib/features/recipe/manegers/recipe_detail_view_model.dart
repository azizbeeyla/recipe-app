import 'package:flutter/material.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/recipes_repository.dart';

import '../../../data/models/recipe_models/recipe_detail_model.dart';

class RecipeDetailViewModel extends ChangeNotifier {
  RecipeDetailViewModel({
    required int categoryId,
    required RecipesRepository detailRepo,
  }) : _detailRepo = detailRepo {
    fetchRecipeDetail(categoryId: categoryId);
  }

  final RecipesRepository _detailRepo;
  late RecipeDetailModel details;
  String? errorMassege;
  bool loading = true;

  Future<void> fetchRecipeDetail({required int categoryId}) async {
    loading = true;
    notifyListeners();

    var result = await _detailRepo.getRecipesDetail(categoryId: categoryId);
    result.fold(
      (error) => errorMassege = error.toString(),
      (value) => details = value,
    );

    loading = false;
    notifyListeners();
  }
}
