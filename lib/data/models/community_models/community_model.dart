class CommunityModel {
  final int id, reviewsCount, timeRequired;
  final String title, description, photo;
  final num rating;
  final DateTime created;
  final UserModel user;

  CommunityModel({
    required this.id,
    required this.reviewsCount,
    required this.timeRequired,
    required this.title,
    required this.created,
    required this.description,
    required this.photo,
    required this.rating,
    required this.user,
  });

  factory CommunityModel.fromJson(Map<String, dynamic> json) {
    return CommunityModel(
      id: json["id"],
      reviewsCount: json["reviewsCount"],
      timeRequired: json["timeRequired"],
      title: json["title"],
      description: json["description"],
      created: DateTime.parse(json["created"]),
      photo: json["photo"],
      rating: json["rating"],
      user: UserModel.fromJson(json["user"]),
    );
  }
}

class UserModel {
  final int id;
  final String profilePhoto, username, firstName, lastName;

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
