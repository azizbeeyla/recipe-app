import 'package:flutter/material.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/user_repositores/user_repository.dart';

import '../../../data/models/top_chef_models/top_chef_model.dart';

class TopChefViewModel extends ChangeNotifier {
  TopChefViewModel({
    required UsersRepository topChetOneRepo,
    required UsersRepository topChetTwoRepo,
    required UsersRepository topChetThreeRepo,
  }) : _topChefOneRepo = topChetOneRepo,
       _topChefTwoRepo = topChetTwoRepo,
       _topChefThreeRepo = topChetThreeRepo;

  final UsersRepository _topChefOneRepo, _topChefTwoRepo, _topChefThreeRepo;
  String? topChefOneError, topChefTwoError, topChefThreeError;
  bool topChefLoading = true;
  List<TopChefModel> topChefOne = [];

  Future<void> fetchTopChefOne({required int limit, required int page}) async {
    topChefLoading = true;
    notifyListeners();

    var result =  await _topChefOneRepo.getTopChef(limit: limit, page: page);
    result.fold(((e){
      return topChefOneError = e.toString();
    }), (value){
      return topChefOne = value;
    });

    topChefLoading = false;
    notifyListeners();
  }

  List<TopChefModel> topChefTwo = [];

  Future<void> fetchTopChefTwo({required int limit, required int page}) async {
    topChefLoading = true;
    notifyListeners();

    var result =  await _topChefTwoRepo.getTopChef(limit: limit, page: page);
    result.fold(((e){
      return topChefTwoError = e.toString();
    }), (value){
      return topChefTwo = value;
    });

    topChefLoading = false;
    notifyListeners();
  }

  List<TopChefModel> topChefThree = [];

  Future<void> fetchTopChefThree({
    required int limit,
    required int page,
  }) async {
    topChefLoading = true;
    notifyListeners();

    var result =  await _topChefThreeRepo.getTopChef(limit: limit, page: page);
    result.fold(((e){
      return topChefThreeError = e.toString();
    }), (value){
      return topChefThree = value;
    });

    topChefLoading = false;
    notifyListeners();
  }
}
