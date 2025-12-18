class TrendingRecipeModel {
  final int id, categoryId;
  final String title, description, photo;
  final num rating, timeRequired;

  TrendingRecipeModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.photo,
    required this.rating,
    required this.timeRequired,
  });

  factory TrendingRecipeModel.fromJson(Map<String, dynamic> json) {
    return TrendingRecipeModel(
      id: json["id"],
      categoryId: json["categoryId"],
      title: json["title"] ,
      description: json["description"],
      photo: json["photo"],
      rating: json["rating"],
      timeRequired: json["timeRequired"],
    );
  }
}
