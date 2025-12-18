import 'package:dio/dio.dart';

import '../../core/client.dart';
import '../../core/utils/result.dart';
import '../models/reviews_models/reviews_comment_model.dart';

class ReviewsRepository {
  ReviewsRepository({
    required ApiClient client,
  }) : _client = client;
  final ApiClient _client;

  Future<Result<List<ReviewsCommentModel>>> getReviews({required int categoryId}) async {
    var response = await _client.get<List>("/reviews/list?recipeId=$categoryId");
    return response.fold(
      (error) => Result.error(error),
      (val) => Result.ok(val.map((item) => ReviewsCommentModel.fromJson(item)).toList()),
    );
  }

  Future<Result<dynamic>> getAddReviews(Map<String, dynamic> data) async {
    var response = await _client.post("/reviews/create", data: FormData.fromMap(data));
    return response.fold(
      (error) => Result.error(error),
      (val) {
        return Result.ok(val["accessToken"]);
      },
    );
  }
}
