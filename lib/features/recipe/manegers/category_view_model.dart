import 'package:flutter/material.dart';

import '../../../data/interfaces/category_repocitories_interfaces.dart';
import '../../../data/models/category_models/category_model.dart';

class CategoryViewModel extends ChangeNotifier {
  CategoryViewModel({required ICategoryRepositories catRepo}) : _catRepo = catRepo {
    fetchRecipe();
  }

  final ICategoryRepositories _catRepo;
  List<CategoryModel> recipe = [];
  bool loading = true;
  String? errorMassege;

  Future<void> fetchRecipe() async {
    loading = true;
    notifyListeners();

    var result = await _catRepo.getCategory();
    result.fold(
      (error) => errorMassege = error.toString(),
      (value) => recipe = value,
    );

    loading = false;
    notifyListeners();
  }
}
