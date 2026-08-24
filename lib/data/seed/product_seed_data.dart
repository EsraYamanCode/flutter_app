import 'package:flutter_deneme/data/models/product_model.dart';

class ProductSeedData {
  static List<ProductModel> initialProducts = [
    ProductModel(
      productId: '1',
      productTitle: 'Kalemlik',
      productCategoryId: '2',
      barcode: 'A101',
      productStatus: false,
      isDeleted: false,
    ),
    ProductModel(
      productId: '2',
      productTitle: 'Kalem',
      productCategoryId: '2',
      barcode: 'A102',
      productStatus: false,
      isDeleted: false,
    ),
    ProductModel(
      productId: '3',
      productTitle: 'Klavye',
      productCategoryId: '3',
      barcode: 'A103',
      productStatus: false,
      isDeleted: false,
    ),
    ProductModel(
      productId: '4',
      productTitle: 'Test ürünü (kategori yok)',
      productCategoryId: null,
      barcode: 'A104',
      productStatus: false,
      isDeleted: false,
    ),
  ];
}
