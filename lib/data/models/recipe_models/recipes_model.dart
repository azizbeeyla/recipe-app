import 'package:hive/hive.dart';

class RecipesModel {
  final int id, categoryId;
  final String title, description, difficulty, photo;
  final num rating;
  final int timeRequired;

  RecipesModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.photo,
    required this.timeRequired,
    required this.rating,
  });

  factory RecipesModel.fromJson(Map<String, dynamic> json) {
    return RecipesModel(
      id: json["id"],
      categoryId: json["categoryId"],
      title: json["title"],
      description: json["description"],
      difficulty: json["difficulty"],
      photo: json["photo"],
      timeRequired: json["timeRequired"],
      rating: json["rating"],
    );
  }
}

class RecipesModelAdapder extends TypeAdapter<RecipesModel> {
  @override
  int get typeId => 6;

  @override
  void write(BinaryWriter writer, RecipesModel obj) {
    writer.write(obj.id);
    writer.write(obj.categoryId);
    writer.write(obj.title);
    writer.write(obj.description);
    writer.write(obj.difficulty);
    writer.write(obj.photo);
    writer.write(obj.timeRequired);
    writer.write(obj.rating);
  }

  @override
  RecipesModel read(BinaryReader reader) {
    return RecipesModel(
      id: reader.read(),
      categoryId: reader.read(),
      title: reader.read(),
      description: reader.read(),
      difficulty: reader.read(),
      photo: reader.read(),
      timeRequired: reader.read(),
      rating: reader.read(),
    );
  }
}
