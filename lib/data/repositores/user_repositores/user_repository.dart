import 'package:recipe_app_ui_kit_food/core/client.dart';
import 'package:recipe_app_ui_kit_food/core/utils/result.dart';
import 'package:recipe_app_ui_kit_food/data/models/user/profile_model.dart';

import '../../models/top_chef_models/top_chef_model.dart';
import 'user_repository_local.dart';
import 'user_repository_remote.dart';

class UsersRepository {
  UsersRepository({
    required ApiClient client,
    required UserRepositoryLocal localRepo,
    required UserRepositoryRemote remoteRepo,
  }) : _client = client,
       _localRepo = localRepo,
       _remoteRepo = remoteRepo;

  final UserRepositoryLocal _localRepo;
  final UserRepositoryRemote _remoteRepo;
  final ApiClient _client;
  bool ignoreCache = false;

  Future<Result<ProfileModel>> getAll() async {
    if (!ignoreCache) {
      final cachedProfile = await _localRepo.getProfileLocal();
      if (cachedProfile != null) {
        return Result.ok(cachedProfile);
      }
    }

    final result = await _remoteRepo.getProfileRemote();

    return result.fold(
      (error) => Result.error(error),
      (value) async {
        await _localRepo.saveProfile(value);
        return Result.ok(value);
      },
    );
  }

  Future<Result<List<TopChefModel>>> getTopChef({required int limit, required int page}) async {
    var response = await _client.get<List>("/top-chefs/list?Page=$page&Limit=$limit");
    return response.fold(
      (error) => Result.error(error),
      (val) => Result.ok(val.map((item) => TopChefModel.fromJson(item)).toList()),
    );
  }

  Future<Result<ProfileModel>> getTopChefDetail({required int id}) async {
    var response = await _client.get("/auth/details/$id");
    return response.fold(
      (error) => Result.error(error),
      (val) => Result.ok(ProfileModel.fromJson(val as Map<String, dynamic>)),
    );
  }

  Future<Result<List<TopChefModel>>> getTopChefFollowers({bool ignoreCacheFollow = false, required int id}) async {
    if (!ignoreCacheFollow) {
      final cachedFollowers = await _localRepo.getFollowersLocal();
      if (cachedFollowers.isNotEmpty) return Result.ok(cachedFollowers);
    }

    final result = await _remoteRepo.getFollowersRemote(id: id);

    return result.fold(
      (error) => Result.error(error),
      (value) async {
        await _localRepo.saveFollowers(value);
        return Result.ok(value);
      },
    );
  }

  Future<Result<List<TopChefModel>>> getTopChefFollowings({bool ignoreCacheFollow = false, required int id}) async {
    if (!ignoreCacheFollow) {
      final cachedFollowings = await _localRepo.getFollowingsLocal();
      if (cachedFollowings.isNotEmpty) return Result.ok(cachedFollowings);
    }

    final result = await _remoteRepo.getFollowingsRemote(id: id);

    return result.fold(
      (error) => Result.error(error),
      (value) async {
        await _localRepo.saveFollowings(value);
        return Result.ok(value);
      },
    );
  }

  Future<Result<void>> follow({required int id}) async {
    var response = await _client.post("/auth/follow/$id", data: null);
    return response.fold(
      (error) => Result.error(error),
      (success) => Result.ok(null),
    );
  }

  Future<Result<void>> unFollow({required int id}) async {
    var response = await _client.post("/auth/unfollow/$id", data: null);
    return response.fold(
      (error) => Result.error(error),
      (success) => Result.ok(null),
    );
  }

  Future<Result<void>> removeFollow({required int id}) async {
    var response = await _client.post("/auth/remove-follower/$id", data: null);
    return response.fold(
      (error) => Result.error(error),
      (success) => Result.ok(null),
    );
  }
}
