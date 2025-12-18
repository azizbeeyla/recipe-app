
import '../../core/client.dart';
import '../../core/utils/result.dart';
import '../models/community_models/community_model.dart';
import '../models/recipe_models/recipe_detail_model.dart';
import '../models/recipe_models/recipes_model.dart';
import '../models/reviews_models/reviews_add_model.dart';
import '../models/reviews_models/reviews_model.dart';
import '../models/trending_recipes_model/trending_recipes_model.dart';

class RecipesRepository {
  RecipesRepository({
    required ApiClient client,
  }) : _client = client;

  final ApiClient _client;

  final bool ignoreCacheRecipes = false;

  Future<Result<List<RecipesModel>>> getRecipes(Map<String, dynamic> queryParams) async {
    var response = await _client.get<List>("/recipes/list", queryParams: queryParams);
    return response.fold(
      (error) => Result.error(error),
      (val) => Result.ok(val.map((item) => RecipesModel.fromJson(item)).toList()),
    );
  }

  Future<Result<RecipeDetailModel>> getRecipesDetail({required int categoryId}) async {
    var response = await _client.get("/recipes/detail/$categoryId");
    return response.fold(
      (error) => Result.error(error),
      (val) => Result.ok(RecipeDetailModel.fromJson(val as Map<String, dynamic>)),
    );
  }

  Future<Result<ReviewsAddModel>> getCreateReview({required int categoryId}) async {
    var response = await _client.get("/recipes/create-review/$categoryId");
    return response.fold(
      (error) => Result.error(error),
      (val) => Result.ok(ReviewsAddModel.fromJson(val as Map<String, dynamic>)),
    );
  }

  Future<Result<ReviewsModel>> getReviewDetail({required int categoryId}) async {
    var response = await _client.get("/recipes/reviews/detail/$categoryId");
    return response.fold(
      (error) => Result.error(error),
      (val) => Result.ok(ReviewsModel.fromJson(val as Map<String, dynamic>)),
    );
  }

  Future<Result<TrendingRecipeModel>> getTredingRecipe() async {
    var response = await _client.get("/recipes/trending-recipe");
    return response.fold(
      (error) => Result.error(error),
      (val) => Result.ok(TrendingRecipeModel.fromJson(val as Map<String, dynamic>)),
    );
  }

  Future<Result<List<RecipesModel>>> getMyRecipes() async {
    var response = await _client.get<List>("/recipes/my-recipes");
    return response.fold(
      (error) => Result.error(error),
      (val) => Result.ok(
        val.map((item) => RecipesModel.fromJson(item)).toList(),
      ),
    );
  }

  Future<Result<List<CommunityModel>>> getCommunity(Map<String, dynamic> queryParams) async {
    var response = await _client.get<List>("/recipes/community/list", queryParams: queryParams);
    return response.fold(
      (error) => Result.error(error),
      (val) => Result.ok(
        val.map((item) => CommunityModel.fromJson(item)).toList(),
      ),
    );
  }

  Future<Result<void>> createRecipe(Map<String, dynamic> data) async {
    var reseponse = await _client.post<Map>("/recipes/create", data: data);
    return reseponse.fold(
      (error) => Result.error(error),
      (success) => Result.ok(null),
    );
  }
}
