import 'package:flutter/material.dart';

class ReviewsAddModel {
  final int id;
  final String photo, title;

  ReviewsAddModel({
    required this.id,
    required this.photo,
    required this.title,
  });

  factory ReviewsAddModel.fromJson(Map<String, dynamic> json) {
    return ReviewsAddModel(
      id: json["id"],
      photo: json["photo"],
      title: json["title"],
    );
  }
}
