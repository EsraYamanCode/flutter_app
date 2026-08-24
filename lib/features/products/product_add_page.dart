import 'package:flutter/material.dart';
import 'package:flutter_deneme/data/models/product_model.dart';
import 'package:flutter_deneme/features/categories/category_provider.dart';
import 'package:flutter_deneme/features/products/product_provider.dart';
import 'package:provider/provider.dart';

class ProductAddPage extends StatefulWidget {
  const ProductAddPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProductAddPage();
}

class _ProductAddPage extends State<ProductAddPage> {
  final _formKey = GlobalKey<FormState>();
  final _productTitleController = TextEditingController();
  final _barcodeController = TextEditingController();
  String? _selectedCategoryId;
  bool _status = true;

  @override
  void dispose() {
    _productTitleController.dispose();
    _barcodeController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final productTitle = _productTitleController.text.trim();
    final barcode = _barcodeController.text.trim();

    final provider = context.read<ProductProvider>();

    final product = ProductModel(
      productId: DateTime.now().millisecondsSinceEpoch.toString(),
      productTitle: productTitle,
      barcode: barcode,
      productStatus: _status,
      productCategoryId: _selectedCategoryId,
    );

    provider.addProduct(product);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final categoryList = context.watch<CategoryProvider>().categories;
    List<DropdownMenuItem<String?>> dropdownItems = [];
    dropdownItems.add(
      const DropdownMenuItem<String?>(value: null, child: Text('Kategori Yok')),
    );

    for (var cat in categoryList) {
      if (!cat.isDeleted) {
        dropdownItems.add(
          DropdownMenuItem<String?>(
            value: cat.categoryId,
            child: Text(cat.categoryTitle),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('ADD PRODUCT')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _productTitleController,
                decoration: const InputDecoration(
                  labelText: 'ProductTitle',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'ürün adı zorunludur.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              DropdownButtonFormField<String?>(
                value: _selectedCategoryId,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                items: dropdownItems,
                onChanged: (selectedId) {
                  setState(() {
                    _selectedCategoryId = selectedId;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _barcodeController,
                decoration: const InputDecoration(
                  labelText: 'barcode',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              CheckboxListTile(
                title: Text(_status ? 'aktif' : 'pasif'),
                value: _status,
                onChanged: (value) {
                  setState(() {
                    _status = value ?? true;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('ADD PRODUCT'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
