import 'package:flutter/material.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/recipes_repository.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/reviews_repository.dart';

import '../../../data/models/reviews_models/reviews_add_model.dart';
import '../../../data/models/reviews_models/reviews_create_model.dart';

class ReviewsAddViewModel extends ChangeNotifier {
  ReviewsAddViewModel({
    required int categoryId,
    required RecipesRepository recipesRepo,
    required ReviewsRepository reviewsRepo,
  }) : _recipesRepo = recipesRepo,
       _reviewsRepo = reviewsRepo {
    fetchReviewDetailComment(categoryId: categoryId);
  }

  final RecipesRepository _recipesRepo;
  final ReviewsRepository _reviewsRepo;
  late ReviewsAddModel commentsAdd;
  String? errorMassege,errorm;
  bool loading = true;

  Future<void> fetchReviewDetailComment({required int categoryId}) async {
    loading = true;
    notifyListeners();

    var result = await _recipesRepo.getCreateReview(categoryId: categoryId);
    result.fold(
      (error) {
        return errorMassege = error.toString();
      },
      (value) {
        return commentsAdd = value;
      },
    );
    loading = false;
    notifyListeners();
  }

  void fetchReviewsCreate({
    required ReviewsCreateModel createModel,
    required VoidCallback onError,
    required VoidCallback onSuccess,
  }) async {
    loading = true;
    notifyListeners();

    final data = await _reviewsRepo.getAddReviews({
      "RecipeId": createModel.recipeId,
      "Comment": createModel.comment,
      "Rating": createModel.rating,
      "Recommend": createModel.recommend,
    });
    data.fold(
      (e) {
        errorm = e.toString();
        onError();
      },
      (success) {
        onSuccess();
      },
    );

    loading = false;
    notifyListeners();
  }
}
