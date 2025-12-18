import 'package:hive/hive.dart';

class OnboardingModel {
  final int id;
  final String title, subtitle, image;

  OnboardingModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  factory OnboardingModel.fromJson(Map<String, dynamic> json) {
    return OnboardingModel(
      id: json["id"],
      title: json["title"],
      subtitle: json["subtitle"],
      image: json["image"],
    );
  }
}

class OnboardingModelAdapder extends TypeAdapter<OnboardingModel> {
  @override
  int get typeId => 2;

  @override
  void write(BinaryWriter writer, OnboardingModel obj) {
    writer.write(obj.id);
    writer.write(obj.title);
    writer.write(obj.subtitle);
    writer.write(obj.image);
  }

  @override
  OnboardingModel read(BinaryReader reader) {
    return OnboardingModel(
      id: reader.read(),
      title: reader.read(),
      subtitle: reader.read(),
      image: reader.read(),
    );
  }
}
