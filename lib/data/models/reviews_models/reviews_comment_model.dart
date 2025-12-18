class ReviewsCommentModel {
  final int id;
  final num rating;
  final String comment, created;
  final UserModel user;

  ReviewsCommentModel({
    required this.id,
    required this.comment,
    required this.rating,
    required this.user,
    required this.created,
  });

  factory ReviewsCommentModel.fromJson(Map<String, dynamic> json) {
    return ReviewsCommentModel(
      id: json["id"],
      comment: json["comment"],
      rating: json["rating"],
      created: 'created',
      user: UserModel.fromJson(json["user"]),
    );
  }
}

class UserModel {
  final int id;
  final String profilePhoto, username;

  UserModel({
    required this.id,
    required this.profilePhoto,
    required this.username,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      profilePhoto: json["profilePhoto"],
      username: json["username"],
    );
  }
}
