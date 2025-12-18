import 'package:flutter/material.dart';
import '../../../data/models/recipe_models/recipes_model.dart';
import '../../../data/repositores/recipes_repository.dart';

class CategoriesViewModel extends ChangeNotifier {
  CategoriesViewModel({
    required int categoryId,
    required RecipesRepository recipeRepo,
  }) : _recipeRepo = recipeRepo {
    fetchRecipeList(categoryId: categoryId);
  }

  final RecipesRepository _recipeRepo;
  List<RecipesModel> recipes = [];
  bool loading = true;
  String? errorMassege;

  Future<void> fetchRecipeList({required int categoryId}) async {
    loading = true;
    notifyListeners();

    var result = await _recipeRepo.getRecipes({"CategoryId": categoryId});
    result.fold(
      (error) => errorMassege = error.toString(),
      (value) => recipes = value,
    );

    loading = false;
    notifyListeners();
  }
}
