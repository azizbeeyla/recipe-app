import '../../../core/client.dart';
import '../../../core/utils/result.dart';
import '../../models/top_chef_models/top_chef_model.dart';
import '../../models/user/profile_model.dart';

class UserRepositoryRemote {
  UserRepositoryRemote({
    required ApiClient client,
  }) : _client = client;
  final ApiClient _client;

  Future<Result<ProfileModel>> getProfileRemote() async {
    var response = await _client.get("/auth/me");

    return response.fold(
      (error) => Result.error(error),
      (val) => Result.ok(ProfileModel.fromJson(val as Map<String, dynamic>)),
    );
  }

  Future<Result<List<TopChefModel>>> getFollowersRemote({required int id}) async {
      var response = await _client.get<List>("/auth/followers/$id");

    return response.fold(
          (error) => Result.error(error),
          (value) {
        return Result.ok(value.map((x) => TopChefModel.fromJson(x)).toList());
      },
    );
  }

  Future<Result<List<TopChefModel>>> getFollowingsRemote({required int id}) async {
      var response = await _client.get<List>("/auth/followings/$id");

    return response.fold(
          (error) => Result.error(error),
          (value) {
        return Result.ok(value.map((x) => TopChefModel.fromJson(x)).toList());
      },
    );
  }
}
