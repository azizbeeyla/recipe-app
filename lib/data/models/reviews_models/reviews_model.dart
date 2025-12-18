class ReviewsModel {
  final int id,reviewsCount;
  final num rating;
  final String title,photo;
  final UserModel user;


  ReviewsModel({
    required this.id,
    required this.title,
    required this.photo,
    required this.rating,
    required this.reviewsCount,
    required this.user,

  });

  factory ReviewsModel.fromJson(Map<String, dynamic> json) {
    return ReviewsModel(
      id: json["id"],
      title: json["title"],
      photo: json["photo"],
      rating: json["rating"],
      reviewsCount: json["reviewsCount"],
      user: UserModel.fromJson(json["user"]),
    );
  }
}

class UserModel {
  final int id;
  final String profilePhoto,username,firstName,lastName;

  UserModel({
    required this.id,
    required this.profilePhoto,
    required this.username,
    required this.firstName,
    required this.lastName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      profilePhoto: json["profilePhoto"],
      username: json["username"],
      firstName: json["firstName"],
      lastName: json["lastName"],
    );
  }
}