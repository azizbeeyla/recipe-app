import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  final int id;
  final String title, image;

  CategoryModel({
    required this.id,
    required this.title,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
}

class CategoryModelAdapder extends TypeAdapter<CategoryModel> {
  @override
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, CategoryModel obj) {
    writer.write(obj.id);
    writer.write(obj.title);
    writer.write(obj.image);
  }

  @override
  CategoryModel read(BinaryReader reader) {
    return CategoryModel(
      id: reader.read(),
      title: reader.read(),
      image: reader.read(),
    );
  }
}
