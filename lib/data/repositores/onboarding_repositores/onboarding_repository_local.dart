import 'package:hive/hive.dart';

import '../../models/onboarding_models/allergic_model.dart';
import '../../models/onboarding_models/onboarding_model.dart';

class OnboardingRepositoryLocal {
  final _boxOb = Hive.box<OnboardingModel>('onboarding');
  final _boxCuisine = Hive.box<AllergicModel>('cuisine');
  final _boxAllergic = Hive.box<AllergicModel>('allergic');

  Future<List<OnboardingModel>> getOnboardingLocal() async {
    return _boxOb.values.toList();
  }
  Future<void> saveOb(List<OnboardingModel> categories) async {
    await _boxOb.clear();
    await _boxOb.addAll(categories);
  }

  Future<List<AllergicModel>> getCuisineLocal() async {
    return _boxCuisine.values.toList();
  }
  Future<void> saveCuisine(List<AllergicModel> cuisine) async {
    await _boxCuisine.clear();
    await _boxCuisine.addAll(cuisine);
  }

  Future<List<AllergicModel>> getAllergicLocal() async {
    return _boxAllergic.values.toList();
  }
  Future<void> saveAllergic(List<AllergicModel> cuisine) async {
    await _boxAllergic.clear();
    await _boxAllergic.addAll(cuisine);
  }
}

