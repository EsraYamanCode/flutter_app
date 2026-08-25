import 'package:flutter/material.dart';
import 'package:flutter_deneme/features/categories/category_edit_page.dart';
import 'package:flutter_deneme/features/categories/category_provider.dart';
import 'package:provider/provider.dart';
import 'category_add_page.dart';
import '../../core/localization/app_strings.dart';

class CategoryManagement extends StatelessWidget {
  const CategoryManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      color: Color.fromARGB(255, 215, 207, 191),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text("${index + 1}"),
                          backgroundColor: Color.fromARGB(255, 193, 169, 139),
                        ),
                        title: Text(category.categoryTitle),
                        subtitle: Text(category.categoryDescription),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Color.fromARGB(255, 135, 114, 89),
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
                                    SnackBar(
                                      content: Text(
                                        AppStrings.tr(context, 'snack1'),
                                      ),
                                    ),
                                  );
                                }
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
                                            provider.deleteCategory(
                                              category.categoryId,
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
                MaterialPageRoute(
                  builder: (context) => const CategoryAddPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
