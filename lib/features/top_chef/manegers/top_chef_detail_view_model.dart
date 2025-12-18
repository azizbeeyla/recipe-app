import 'package:flutter/cupertino.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/user_repositores/user_repository.dart';

import '../../../data/models/user/profile_model.dart';

class TopChefDetailViewModel extends ChangeNotifier {
  TopChefDetailViewModel({
    required UsersRepository repository,
    required int id,
  }) : _repository = repository {
    fetchTopChefDetail(id);
  }

  final UsersRepository _repository;

  late ProfileModel chefDetail;
  bool loading = false;
  String? errorMessage;

  Future<void> fetchTopChefDetail(int id) async {
    loading = true;
    notifyListeners();

    var result = await _repository.getTopChefDetail(id: id);
    result.fold(((e){
      return errorMessage = e.toString();
    }), (value){
      return chefDetail = value;
    });

    loading = false;
    notifyListeners();
  }
}
