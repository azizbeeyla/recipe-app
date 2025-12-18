import 'package:flutter/material.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/user_repositores/user_repository.dart';

import '../../../data/models/category_models/category_model.dart';
import '../../../data/models/recipe_models/recipes_model.dart';
import '../../../data/models/top_chef_models/top_chef_model.dart';
import '../../../data/models/trending_recipes_model/trending_recipes_model.dart';
import '../../../data/repositores/category_repositores/category_repository.dart';
import '../../../data/repositores/recipes_repository.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({
    required CategoryRepository homeRepo,
    required RecipesRepository recipesRepo,
    required UsersRepository usersRepo,
  }) : _homeRepo = homeRepo,
       _recipesRepo = recipesRepo,
       _usersRepo = usersRepo {
    fetchTrendingRecipe();
  }

  final CategoryRepository _homeRepo;
  final RecipesRepository _recipesRepo;
  final UsersRepository _usersRepo;

  String? categoryError, recipeError, topChefError, recentlyError,trendingError;

  bool categoryLoading = true,
      trendingRecipeLoading = true,
      recipeLoading = true,
      topChefLoading = true,
      recentlyLoading = true;

  List<CategoryModel> categoriy = [];
  Future<void> fetchCategoriy() async {
    categoryLoading = true;
    notifyListeners();

    var result = await _homeRepo.getCategory();

    result.fold(
      ((e) {
        return categoryError = e.toString();
      }),
      (value) {
        return categoriy = value;
      },
    );

    categoryLoading = false;
    notifyListeners();
  }

  late TrendingRecipeModel trendingRecipe;
  Future<void> fetchTrendingRecipe() async {
    trendingRecipeLoading = true;
    notifyListeners();

    var result = await _recipesRepo.getTredingRecipe();
    result.fold(
      ((e) {
        return trendingError = e.toString();
      }),
          (value) {
        return trendingRecipe = value;
      },
    );

    trendingRecipeLoading = false;
    notifyListeners();
  }

  List<RecipesModel> recipe = [];
  Future<void> fetchRecipe() async {
    recipeLoading = true;
    notifyListeners();

    var result = await _recipesRepo.getRecipes({"Page": 6, "Limit": 2});
    result.fold(
      ((e) {
        return categoryError = e.toString();
      }),
      (value) {
        return recipe = value;
      },
    );

    recipeLoading = false;
    notifyListeners();
  }

  List<TopChefModel> topChef = [];
  Future<void> fetchTopChef({required int limit, required int page}) async {
    topChefLoading = true;
    notifyListeners();

    var result = await _usersRepo.getTopChef(limit: limit, page: page);
    result.fold(
      ((e) {
        return categoryError = e.toString();
      }),
      (value) {
        return topChef = value;
      },
    );
    topChefLoading = false;
    notifyListeners();
  }

  List<RecipesModel> recently = [];

  Future<void> fetchRecently() async {
    recentlyLoading = true;
    notifyListeners();

    var result = await _recipesRepo.getRecipes({"Page": 11, "Limit": 2});
    result.fold(
      ((e) {
        return categoryError = e.toString();
      }),
          (value) {
        return recently = value;
      },
    );

    recentlyLoading = false;
    notifyListeners();
  }
}
