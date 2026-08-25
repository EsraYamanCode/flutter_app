import 'package:flutter/material.dart';
import 'package:flutter_deneme/data/models/category_model.dart';
import 'package:flutter_deneme/features/categories/category_provider.dart';
import 'package:flutter_deneme/features/products/product_add_page.dart';
import 'package:flutter_deneme/features/products/product_provider.dart';
import 'package:provider/provider.dart';
import '../../core/localization/app_strings.dart';

class ProductManagement extends StatelessWidget {
  const ProductManagement({super.key});

  CategoryModel? _findCategory(
    String? productCategoryId,
    List<dynamic> categories,
  ) {
    if (productCategoryId == null || productCategoryId.isEmpty) return null;
    for (var category in categories) {
      if (category.categoryId == productCategoryId && !category.isDeleted) {
        return category;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final categoryList = context.watch<CategoryProvider>().categories;
    List<DropdownMenuItem<String?>> dropdownItems = [];
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: Consumer2<ProductProvider, CategoryProvider>(
              builder: (context, productProvider, categoryProvider, child) {
                return ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: productProvider.products.length,
                  itemBuilder: (context, index) {
                    final product = productProvider.products[index];
                    final matchedCategory = _findCategory(
                      product.productCategoryId,
                      categoryProvider.categories,
                    );

                    return Card(
                      color: Color.fromARGB(255, 215, 207, 191),
                      margin: const EdgeInsets.only(bottom: 6),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text("${index + 1}"),
                          backgroundColor: Color.fromARGB(255, 193, 169, 139),
                        ),
                        title: Text(product.productTitle),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            matchedCategory != null
                                ? Text(matchedCategory.categoryTitle)
                                : Row(
                                    children: [
                                      Text(
                                        AppStrings.tr(context, 'noCategory'),
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      const SizedBox(width: 10),
                                      DropdownButton<String?>(
                                        hint: Text(
                                          AppStrings.tr(
                                            context,
                                            'assignCategory',
                                          ),
                                        ),
                                        items: dropdownItems,
                                        onChanged: (selectedId) {
                                          if (selectedId != null) {
                                            productProvider.updateProduct(
                                              product.copyWith(
                                                productCategoryId: selectedId,
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                            Text(product.barcode),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Color.fromARGB(255, 135, 114, 89),
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        AppStrings.tr(context, 'to_inform'),
                                      ),
                                      content: Text(
                                        AppStrings.tr(context, 'description'),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            AppStrings.tr(context, 'okey'),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Color.fromARGB(255, 135, 114, 89),
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Text(
                                        AppStrings.tr(context, 'delete'),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            productProvider.deleteProduct(
                                              product.productId,
                                            );
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            AppStrings.tr(context, 'yes'),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            AppStrings.tr(context, 'no'),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add, color: Colors.deepPurple),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductAddPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
