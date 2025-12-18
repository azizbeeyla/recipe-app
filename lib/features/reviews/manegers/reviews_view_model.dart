import 'package:flutter/material.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/recipes_repository.dart';

import '../../../data/models/reviews_models/reviews_comment_model.dart';
import '../../../data/models/reviews_models/reviews_model.dart';
import '../../../data/repositores/reviews_repository.dart';

class ReviewsViewModel extends ChangeNotifier {
  ReviewsViewModel({
    required int categoryId,
    required RecipesRepository recipesRepo,
    required ReviewsRepository reviewsRepo,
  }) : _recipesRepo = recipesRepo,
       _reviewsRepo = reviewsRepo {
    fetchReviewDetail(categoryId: categoryId);
    fetchReviewDetailComment(categoryId: categoryId);
  }

  final RecipesRepository _recipesRepo;
  final ReviewsRepository _reviewsRepo;

  late ReviewsModel review;
  List<ReviewsCommentModel> comments = [];

  String? errorMassege, errorReviews;
  bool loadingDetail = true, loadingReviews = true;


  Future<void> fetchReviewDetail({required int categoryId}) async {
    loadingDetail = true;
    notifyListeners();

    var result = await _recipesRepo.getReviewDetail(categoryId: categoryId);
    result.fold(
      (error) => errorMassege = error.toString(),
      (value) => review = value,
    );

    loadingDetail = false;
    notifyListeners();
  }

  Future<void> fetchReviewDetailComment({required int categoryId}) async {
    loadingReviews = true;
    notifyListeners();

    var result = await _reviewsRepo.getReviews(categoryId: categoryId);
    result.fold(
          (error) => errorReviews = error.toString(),
          (value) => comments = value,
    );

    loadingReviews = false;
    notifyListeners();
  }
}
