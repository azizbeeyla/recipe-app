import 'package:flutter/material.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/onboarding_repositores/onboarding_repository.dart';

import '../../../data/models/onboarding_models/allergic_model.dart';

class AllergicViewModel extends ChangeNotifier {
  AllergicViewModel({required OnboardingRepository allergicRepo}) : _allergicRepo = allergicRepo;

  String? error;
  final OnboardingRepository _allergicRepo;
  List<AllergicModel> allergic = [];
  bool loading = true;

  Future<void> fetchAllergic() async {
    loading = true;
    notifyListeners();

    var result = await _allergicRepo.getAllergic();
    result.fold(
      ((e) => error = e.toString()),
      (value) => allergic = value,
    );

    loading = false;
    notifyListeners();
  }
}
