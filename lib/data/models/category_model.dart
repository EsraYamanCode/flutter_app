class CategoryModel {
  final String CategoryId;
  final String CategoryTitle;
  final String CategoryDescription;
  final bool Status;
  final bool isDeleted;

  CategoryModel({
    required this.CategoryId,
    required this.CategoryTitle,
    required this.CategoryDescription,
    required this.Status,
    this.isDeleted = false,
  });
  CategoryModel copyWith({
    String? CategoryId,
    String? CategoryTitle,
    String? CategoryDescription,
    bool? Status,
    bool? isDeleted,
  }) {
    return CategoryModel(
      CategoryId: CategoryId ?? this.CategoryId,
      CategoryTitle: CategoryTitle ?? this.CategoryTitle,
      CategoryDescription: CategoryDescription ?? this.CategoryDescription,
      Status: Status ?? this.Status,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}
