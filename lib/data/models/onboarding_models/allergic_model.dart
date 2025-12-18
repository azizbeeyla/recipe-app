import 'package:hive/hive.dart';

class AllergicModel {
  final int id;
  final String title, image;

  AllergicModel({
    required this.id,
    required this.title,
    required this.image,
  });

  factory AllergicModel.fromJson(Map<String, dynamic> json) {
    return AllergicModel(
      id: json["id"],
      title: json["title"],
      image: json["image"],
    );
  }
}

class AllergicModelAdapder extends TypeAdapter<AllergicModel> {
  @override
  int get typeId => 3;

  @override
  void write(BinaryWriter writer, AllergicModel obj) {
    writer.write(obj.id);
    writer.write(obj.title);
    writer.write(obj.image);
  }

  @override
  AllergicModel read(BinaryReader reader) {
    return AllergicModel(
      id: reader.read(),
      title: reader.read(),
      image: reader.read(),
    );
  }
}
