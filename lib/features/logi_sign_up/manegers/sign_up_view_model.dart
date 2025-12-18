import 'package:flutter/material.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/auth_repostoriy.dart';

import '../../../data/models/auth_models/sign_up_model.dart';

class SignUpViewModel extends ChangeNotifier {
  SignUpViewModel({
    required AuthRepository signRepo,
  }) : _signRepo = signRepo;

  final AuthRepository _signRepo;
  bool isLoading = true;
  String token = "";

  void fetchSignUp({
    required SignUpModel authModel,
    required VoidCallback onError,
    required VoidCallback onSuccess,
  }) async {
    isLoading = true;
    notifyListeners();

    final data = await _signRepo.register({
      "username": authModel.username,
      "firstName": authModel.firstName,
      "lastName": authModel.lastName,
      "email": authModel.email,
      "phoneNumber": authModel.phoneNumber,
      "birthDate": authModel.birthDate,
      "password": authModel.password,
    });
    data.fold(
      (e) {
        onError();
      },
      (success) {
        token = success;
        onSuccess();
      },
    );

    isLoading = false;
    notifyListeners();
  }
}
