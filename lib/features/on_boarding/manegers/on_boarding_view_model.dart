import 'package:flutter/material.dart';
import '../../../data/models/onboarding_models/onboarding_model.dart';
import '../../../data/repositores/onboarding_repositores/onboarding_repository.dart';

class OnBoardingViewModel extends ChangeNotifier {
  OnBoardingViewModel({
    required OnboardingRepository onBoardingRepo,
  }) : _onBoardingRepo = onBoardingRepo;

  final OnboardingRepository _onBoardingRepo;
  String? error;
  List<OnboardingModel> onBoarding = [];
  bool loading = true;

  Future<void> fetchOnBoarding() async {
    loading = true;
    notifyListeners();

    var result = await _onBoardingRepo.getOnboarding();
    result.fold(
      ((e) => error = e.toString()),
      (value) => onBoarding = value,
    );

    loading = false;
    notifyListeners();
  }
}
