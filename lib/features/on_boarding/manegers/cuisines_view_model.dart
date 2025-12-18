import 'package:flutter/material.dart';
import 'package:recipe_app_ui_kit_food/data/models/onboarding_models/allergic_model.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/onboarding_repositores/onboarding_repository.dart';

class CuisinesViewModel extends ChangeNotifier {
  CuisinesViewModel({required OnboardingRepository cuisineRepo}) : _cuisineRepo = cuisineRepo;

  String? error;
  final OnboardingRepository _cuisineRepo;
  List<AllergicModel> cuisine = [];
  bool loading = true;

  Future<void> fetchAllergic() async {
    loading = true;
    notifyListeners();

    var result = await _cuisineRepo.getCuisine();
    result.fold(
      ((e) => error = e.toString()),
      (value) => cuisine = value,
    );

    loading = false;
    notifyListeners();
  }
}
