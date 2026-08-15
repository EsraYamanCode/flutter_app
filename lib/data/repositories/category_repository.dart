import 'package:flutter/material.dart';
import 'package:flutter_deneme/data/models/category_model.dart';
import 'package:flutter_deneme/data/seed/category_seed_data.dart';

class CategoryRepository extends ChangeNotifier {
  final List<CategoryModel> _categories = List.from(
    CategorySeedData.initialCategories,
  );

  List<CategoryModel> get categories =>
      _categories.where((category) => !category.isDeleted).toList();

  bool isTitleExists(String title, {String? excludeId}) {
    return _categories.any(
      (c) =>
          !c.isDeleted &&
          c.categoryTitle.trim().toLowerCase() == title.trim().toLowerCase() &&
          c.categoryId != excludeId,
    );
  }

  void addCategory(CategoryModel category) {
    _categories.add(category);
    notifyListeners();
  }

  void updateCategory(CategoryModel updatedCategory) {
    final index = _categories.indexWhere(
      (c) => c.categoryId == updatedCategory.categoryId,
    );
    if (index != -1) {
      _categories[index] = updatedCategory;
      notifyListeners();
    }
  }

  void deleteCategory(String id) {
    final index = _categories.indexWhere((c) => c.categoryId == id);
    if (index != -1) {
      _categories[index] = _categories[index].copyWith(isDeleted: true);
      notifyListeners();
    }
  }
}
