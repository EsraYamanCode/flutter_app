import 'package:flutter/material.dart';
import 'package:flutter_deneme/features/categories/category_edit_page.dart';
import 'package:flutter_deneme/features/categories/category_provider.dart';
import 'package:provider/provider.dart';
import 'category_add_page.dart';

class CategoryManagement extends StatelessWidget {
  const CategoryManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Category Management"))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Consumer<CategoryProvider>(
                builder: (context, provider, child) {
                  final categories = provider.categories;

                  return ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];

                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(child: Text("${index + 1}")),
                          title: Text(category.categoryTitle),
                          subtitle: Text(category.categoryDescription),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                ),
                                onPressed: () async {
                                  final result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CategoryEditPage(category: category),
                                    ),
                                  );
                                  if (result == true) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Kategori başarıyla güncellendi.',
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text(
                                          'Are you sure delete this category',
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              provider.deleteCategory(
                                                category.categoryId,
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
                  MaterialPageRoute(
                    builder: (context) => const CategoryAddPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
