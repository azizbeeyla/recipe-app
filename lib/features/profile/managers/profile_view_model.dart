import 'package:flutter/material.dart';
import 'package:recipe_app_ui_kit_food/data/models/user/profile_model.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/recipes_repository.dart';

import '../../../data/models/recipe_models/recipes_model.dart';
import '../../../data/repositores/user_repositores/user_repository.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileViewModel({
    required UsersRepository profileRepo,
    required RecipesRepository myRecipeRepo
  }) : _profileRepo = profileRepo,
  _myRecipeRepo = myRecipeRepo{
    fetchProfile();
    fetchMyRecipes();
  }

  final UsersRepository _profileRepo;
  final RecipesRepository _myRecipeRepo;

  List<RecipesModel> recipes = [];
  late ProfileModel profile;

  String? error,errorRecipe;
  bool loading = true, loadingRecipe = true;

  Future<void> fetchProfile() async {
    loading = true;
    notifyListeners();

    var result = await _profileRepo.getAll();
    result.fold(
          (e) {
        return error = e.toString();
      },
          (value) => profile = value,
    );

    loading = false;
    notifyListeners();
  }


  Future<void> fetchMyRecipes() async {
    loadingRecipe = true;

    notifyListeners();

    var result = await _myRecipeRepo.getMyRecipes();
    result.fold(
          (e) {
        return errorRecipe = e.toString();
      },
          (value) => recipes = value,
    );

    loadingRecipe = false;
    notifyListeners();
  }
}
