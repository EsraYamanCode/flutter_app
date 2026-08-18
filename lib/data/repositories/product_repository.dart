import 'package:flutter/material.dart';
import 'package:flutter_deneme/data/models/product_model.dart';
import 'package:flutter_deneme/data/seed/product_seed_data.dart';

class ProductRepository extends ChangeNotifier {
  final List<ProductModel> _products = List.from(ProductSeedData.initialProducts);

  List<ProductModel> get products => _products.where((product) => !product.isDeleted).toList();

  void addProduct(ProductModel product) {
    _products.add(product);
    notifyListeners();
  }

  void updateProduct(ProductModel updatedProduct) {
    final index = _products.indexWhere(
      (p) => p.productId == updatedProduct.productId,
    );
    if (index != -1) {
      _products[index] = updatedProduct;
      notifyListeners();
    }
  }

  void deleteProduct(String id) {
    final index = _products.indexWhere((p) => p.productId == id);
    if (index != -1) {
      _products[index] = _products[index].copyWith(isDeleted: true);
      notifyListeners();
    }
  }
}
