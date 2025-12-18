import 'package:flutter/material.dart';
import 'package:recipe_app_ui_kit_food/data/models/top_chef_models/top_chef_model.dart';

import '../../../data/repositores/user_repositores/user_repository.dart';

class ProfileFollowingFollowersViewModel extends ChangeNotifier {
  ProfileFollowingFollowersViewModel({
    required UsersRepository userRepo,
    required int id,
  }) : _usersRepo = userRepo {
    fetchFollowing(id: id);
    fetchFolower(id: id);
  }

  final UsersRepository _usersRepo;
  List<TopChefModel> followings = [];
  List<TopChefModel> folowers = [];
  bool isLoadingFollowing = true, isLoadingFolower = true;
  String? errorFollowing, errorFollower, errorFollow;

  Future<void> fetchFollowing({required int id}) async {
    isLoadingFollowing = true;
    notifyListeners();

    var result = await _usersRepo.getTopChefFollowings(id: id);
    result.fold(
      (error) => errorFollowing = error.toString(),
      (value) => followings = value,
    );

    isLoadingFollowing = false;
    notifyListeners();
  }

  Future<void> fetchFolower({required int id}) async {
    isLoadingFolower = true;
    notifyListeners();

    var result = await _usersRepo.getTopChefFollowers(id: id);
    result.fold(
      (error) => errorFollower = error.toString(),
      (value) => folowers = value,
    );

    isLoadingFolower = false;
    notifyListeners();
  }

  void fetchFollow({required int id}) async {
    final data = await _usersRepo.follow(id: id);
    data.fold(
      (e) {
        errorFollow = e.toString();
      },
      (success) => null,
    );
    notifyListeners();
  }

  void fetchUnfollow({required int id}) async {
    final data = await _usersRepo.unFollow(id: id);
    data.fold(
      (e) {
        errorFollow = e.toString();
      },
      (success) => null,
    );
    notifyListeners();
  }

  void fetchRemoveFollow({required int id}) async {
    final data = await _usersRepo.removeFollow(id: id);
    data.fold(
      (e) {
        errorFollow = e.toString();
      },
      (success) => null,
    );
    notifyListeners();
  }
}
