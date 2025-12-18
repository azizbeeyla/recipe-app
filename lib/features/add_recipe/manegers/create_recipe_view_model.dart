import 'package:flutter/material.dart';
import 'package:recipe_app_ui_kit_food/data/models/recipe_models/create_recipe_model.dart';

import '../../../data/repositores/recipes_repository.dart';

class CreateRecipeViewModel extends ChangeNotifier {
  CreateRecipeViewModel({
    required RecipesRepository createRecipeRepo,
  }) : _createResipeRepo = createRecipeRepo;
  final RecipesRepository _createResipeRepo;
  bool isLoading = true;

  void fetchCreateRecipe({
    required CreateRecipeModel createRecipeModel,
    required VoidCallback onError,
    required VoidCallback onSuccess,
  }) async {
    isLoading = true;
    notifyListeners();

    final data = await _createResipeRepo.createRecipe({});
    data.fold(
      (e) => onError(),
      (success) => onSuccess(),
    );

    isLoading = false;
    notifyListeners();
  }
}
