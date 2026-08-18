import 'package:flutter_deneme/data/models/product_model.dart';

class ProductSeedData {
  static List<ProductModel> initialProducts = [
    ProductModel(
      productId: '1',
      productTitle: 'Kalemlik',
      productCategoryId: 'Kırtasiye',
      barcode: 'A101',
      productStatus: false,
      isDeleted: false,
    ),
    ProductModel(
      productId: '2',
      productTitle: 'Kalem',
      productCategoryId: 'Kırtasiye',
      barcode: 'A102',
      productStatus: false,
      isDeleted: false,
    ),
    ProductModel(
      productId: '1',
      productTitle: 'Klavye',
      productCategoryId: 'Elektronik',
      barcode: 'A103',
      productStatus: false,
      isDeleted: false,
    ),
  ];
}
