import 'package:flutter/material.dart';
import 'package:recipe_app_ui_kit_food/data/models/trending_recipes_model/trending_recipes_model.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/recipes_repository.dart';

class TrendingRecipesViewModel extends ChangeNotifier {
  TrendingRecipesViewModel({
    required RecipesRepository trendingRepo,
  }) : _trendingRepo = trendingRepo {
    fetchTrendingRecipes();
  }

  final RecipesRepository _trendingRepo;
  late TrendingRecipeModel details;
  String? errorMassege;
  bool loading = true;

  Future<void> fetchTrendingRecipes() async {
    loading = true;
    notifyListeners();

    var result = await _trendingRepo.getTredingRecipe();
    result.fold(
          (error) {
        return errorMassege = error.toString();
      },
          (value) {
        return details = value;
      },
    );

    loading = false;
    notifyListeners();
  }
}
