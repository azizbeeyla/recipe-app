import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:recipe_app_ui_kit_food/core/router/router.dart';
import 'package:recipe_app_ui_kit_food/core/router/routers.dart';

import '../../core/client.dart';
import '../../core/utils/result.dart';
import '../models/top_chef_models/top_chef_model.dart';
import '../models/user/profile_model.dart';

class AuthRepository {
  final _boxProfile = Hive.box<ProfileModel>('profile');
  final _boxFollowers = Hive.box<TopChefModel>('followers');
  final _boxFollowings = Hive.box<TopChefModel>('followings');
  final ApiClient _client;
  final FlutterSecureStorage _secureStorage;

  AuthRepository({
    required ApiClient client,
    required FlutterSecureStorage secureStorage,
  }) : _client = client,
       _secureStorage = secureStorage;

  Future<Result<String>> login(Map<String, dynamic> data) async {
    var response = await _client.post("/auth/login", data: data);
    return response.fold(
      (error) => Result.error(error),
      (success) {
        _secureStorage.write(key: "token", value: success["accessToken"]);
        _secureStorage.write(key: "login", value: data["login"]);
        _secureStorage.write(key: "password", value: data["password"]);
        _boxProfile.clear();
        _boxFollowers.clear();
        _boxFollowings.clear();
        return Result.ok(success["accessToken"]);
      },
    );
  }

  Future<Result<String>> register(Map<String, dynamic> data) async {
    var reseponse = await _client.post("/auth/register", data: data);
    return reseponse.fold(
      (error) {
        return Result.error(error);
      },
      (success) {
        _secureStorage.write(key: "token", value: success["accessToken"]);
        _secureStorage.write(key: "login", value: data["login"]);
        _secureStorage.write(key: "password", value: data["password"]);
        _boxProfile.clear();
        _boxFollowers.clear();
        _boxFollowings.clear();
        return Result.ok(success["accessToken"]);
      },
    );
  }

  Future<void> logout() async {
    _secureStorage.delete(key: "token");
    _secureStorage.delete(key: "login");
    _secureStorage.delete(key: "password");
    router.go(Routers.login);
  }
}
