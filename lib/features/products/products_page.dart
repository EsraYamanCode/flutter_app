import 'package:flutter/material.dart';
import 'package:flutter_deneme/features/products/product_add_page.dart';
import 'package:flutter_deneme/features/products/product_provider.dart';
import 'package:provider/provider.dart';

class ProductManagement extends StatelessWidget {
  const ProductManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Product Management"))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Consumer<ProductProvider>(
                builder: (context, provider, child) {
                  final products = provider.products;

                  return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];

                      return Card(
                        color: Color.fromARGB(255, 215, 207, 191),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text("${index + 1}"),
                            backgroundColor: Color.fromARGB(255, 193, 169, 139),
                          ),
                          title: Text(product.productTitle),
                          subtitle: Text(product.barcode),

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
                                        title: const Text('Bilgilendirme'),
                                        content: const Text(
                                          'ürün düzenleme özelliği bu aşamada zorunlu kapsam dışındadır.',
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text('tamam'),
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
                                        content: const Text(
                                          'Are you sure delete this product?',
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              provider.deleteProduct(
                                                product.productId,
                                              );
                                              Navigator.pop(context);
                                            },
                                            child: const Text('yes'),
                                          ),
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text('no'),
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
      ),
    );
  }
}
