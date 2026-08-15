class CategoryModel {
  final String categoryId;
  final String categoryTitle;
  final String categoryDescription;
  final bool status;
  final bool isDeleted;

  CategoryModel({
    required this.categoryId,
    required this.categoryTitle,
    required this.categoryDescription,
    this.status = false,
    this.isDeleted = false,
  });
  CategoryModel copyWith({
    String? categoryId,
    String? categoryTitle,
    String? categoryDescription,
    bool? status,
    bool? isDeleted,
  }) {
    return CategoryModel(
      categoryId: categoryId ?? this.categoryId,
      categoryTitle: categoryTitle ?? this.categoryTitle,
      categoryDescription: categoryDescription ?? this.categoryDescription,
      status: status ?? this.status,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}
