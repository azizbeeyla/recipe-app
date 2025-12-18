import 'package:hive/hive.dart';

class ProfileModel {
  final int id, recipesCount, followingCount, followerCount;
  final String profilePhoto, username, firstName, lastName, presentation;

  ProfileModel({
    required this.id,
    required this.recipesCount,
    required this.followingCount,
    required this.followerCount,
    required this.profilePhoto,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.presentation,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json["id"],
      recipesCount: json["recipesCount"],
      followingCount: json["followingCount"],
      followerCount: json["followerCount"],
      profilePhoto: json["profilePhoto"],
      username: json["username"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      presentation: json["presentation"],
    );
  }
}

class ProfileModelAdapdet extends TypeAdapter<ProfileModel> {
  @override
  int get typeId => 4;

  @override
  void write(BinaryWriter writer, ProfileModel obj) {
    writer.write(obj.id);
    writer.write(obj.recipesCount);
    writer.write(obj.followingCount);
    writer.write(obj.followerCount);
    writer.write(obj.profilePhoto);
    writer.write(obj.username);
    writer.write(obj.firstName);
    writer.write(obj.lastName);
    writer.write(obj.presentation);
  }

  @override
  ProfileModel read(BinaryReader reader) {
    return ProfileModel(
      id: reader.read(),
      recipesCount: reader.read(),
      followingCount: reader.read(),
      followerCount: reader.read(),
      profilePhoto: reader.read(),
      username: reader.read(),
      firstName: reader.read(),
      lastName: reader.read(),
      presentation: reader.read(),
    );
  }
}
