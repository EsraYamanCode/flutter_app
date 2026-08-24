class ProductModel {
  final String productId;
  final String productTitle;
  final String? productCategoryId;
  final String barcode;
  bool productStatus;
  bool isDeleted;
  
  ProductModel({
    required this.productId,
    required this.productTitle,
    this.productCategoryId,
    required this.barcode,
    this.productStatus = false,
    this.isDeleted = false,
  });

  ProductModel copyWith({
    String? productId,
    String? productTitle,
    String? productCategoryId,
    bool setCategoryNull = false,
    String? barcode,
    bool? productStatus,
    bool? isDeleted,
  }) {
    return ProductModel(
      productId: productId ?? this.productId,
      productTitle: productTitle ?? this.productTitle,
      productCategoryId: setCategoryNull ? null: (productCategoryId ?? this.productCategoryId),
      productStatus: productStatus ?? this.productStatus,
      barcode: barcode ?? this.barcode,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}
