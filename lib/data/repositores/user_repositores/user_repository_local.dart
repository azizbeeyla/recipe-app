import 'package:hive/hive.dart';

import '../../models/top_chef_models/top_chef_model.dart';
import '../../models/user/profile_model.dart';

class UserRepositoryLocal {
  final _boxProfile = Hive.box<ProfileModel>('profile');
  final _boxFollowers = Hive.box<TopChefModel>('followers');
  final _boxFollowings = Hive.box<TopChefModel>('followings');

  Future<ProfileModel?> getProfileLocal() async {
    if (_boxProfile.isNotEmpty) {
      return _boxProfile.values.first;
    }
    return null;
  }
  Future<void> saveProfile(ProfileModel profile) async {
    await _boxProfile.clear();
    await _boxProfile.add(profile);
  }

  Future<List<TopChefModel>> getFollowersLocal() async {
    return _boxFollowers.values.toList();
  }
  Future<void> saveFollowers(List<TopChefModel> followers) async {
    await _boxFollowers.clear();
    await _boxFollowers.addAll(followers);
  }

  Future<List<TopChefModel>> getFollowingsLocal() async {
    return _boxFollowings.values.toList();
  }
  Future<void> saveFollowings(List<TopChefModel> followings) async {
    await _boxFollowings.clear();
    await _boxFollowings.addAll(followings);
  }
}
