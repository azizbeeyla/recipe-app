import 'package:flutter/material.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/recipes_repository.dart';

import '../../../data/models/recipe_models/recipes_model.dart';

class MyRecipeViewModel extends ChangeNotifier {
  MyRecipeViewModel({
    required RecipesRepository myRecipeRepo,
  }) : _myRecipeRepo = myRecipeRepo {
    fetchMyRecipes();
  }

  final RecipesRepository _myRecipeRepo;

  List<RecipesModel> recipes = [];
  String? error;
  bool loading = true;

  Future<void> fetchMyRecipes() async {
    loading = true;

    notifyListeners();

    var result = await _myRecipeRepo.getMyRecipes();
    result.fold(
      (e) {
        return error = e.toString();
      },
      (value) => recipes = value,
    );

    loading = false;
    notifyListeners();
  }
}
