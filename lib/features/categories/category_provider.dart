import 'package:flutter/material.dart';
import 'package:flutter_deneme/data/models/category_model.dart';
import 'package:flutter_deneme/data/repositories/category_repository.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryRepository _categoryRepository;

  CategoryProvider(this._categoryRepository);

  List<CategoryModel> get categories => _categoryRepository.categories;

  bool isTitleExists(String categoryTitle, {String? currentCategoryId}) {
    return _categoryRepository.isTitleExists(
      categoryTitle,
      excludeId: currentCategoryId,
    );
  }

  void addCategory(CategoryModel category) {
    _categoryRepository.addCategory(category);
    notifyListeners();
  }

  void updateCategory(CategoryModel category) {
    _categoryRepository.updateCategory(category);
    notifyListeners();
  }

  void deleteCategory(String categoryId) {
    _categoryRepository.deleteCategory(categoryId);
    notifyListeners();
  }
}
