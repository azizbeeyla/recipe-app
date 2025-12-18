import 'package:hive/hive.dart';

class TopChefModel {
  final String username, firstName, lastName, profilePhoto;
  final int id;

  TopChefModel({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.profilePhoto,
  });

  factory TopChefModel.fromJson(Map<String, dynamic> json) {
    return TopChefModel(
      id: json["id"],
      username: json["username"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      profilePhoto: json["profilePhoto"],
    );
  }
}

class TopChefModelAdapder extends TypeAdapter<TopChefModel> {
  @override
  int get typeId => 5;

  @override
  void write(BinaryWriter writer, TopChefModel obj) {
    writer.write(obj.id);
    writer.write(obj.username);
    writer.write(obj.firstName);
    writer.write(obj.lastName);
    writer.write(obj.profilePhoto);
  }

  @override
  TopChefModel read(BinaryReader reader) {
    return TopChefModel(
      id: reader.read(),
      username: reader.read(),
      firstName: reader.read(),
      lastName: reader.read(),
      profilePhoto: reader.read(),
    );
  }
}
