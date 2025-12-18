class ReviewsCreateModel {
  final int recipeId, rating;
  final String comment;
  final bool recommend;

  ReviewsCreateModel({
    required this.recipeId,
    required this.rating,
    required this.comment,
    required this.recommend,
  });

  Map<String, dynamic> toJson() {
    return {
      "RecipeId": recipeId,
      "Rating": rating,
      "Comment": comment,
      'Recommend': recommend,
    };
  }
}
