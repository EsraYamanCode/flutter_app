import 'package:flutter/material.dart';
import 'package:flutter_deneme/data/models/product_model.dart';
import 'package:flutter_deneme/data/repositories/product_repository.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepository _productRepository;

  ProductProvider(this._productRepository);
  List<ProductModel> get products => _productRepository.products;

  void addProduct(ProductModel product) {
    _productRepository.addProduct(product);
    notifyListeners();
  }

  void updateProduct(ProductModel product) {
    _productRepository.updateProduct(product);
    notifyListeners();
  }

  void deleteProduct(String productId) {
    _productRepository.deleteProduct(productId);
    notifyListeners();
  }
}
