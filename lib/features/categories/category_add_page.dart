import 'package:flutter/material.dart';
import 'package:flutter_deneme/core/validators/category_validator.dart';
import 'package:flutter_deneme/data/models/category_model.dart';
import 'package:flutter_deneme/features/categories/category_provider.dart';
import 'package:provider/provider.dart';
import '../../core/localization/app_strings.dart';

class CategoryAddPage extends StatefulWidget {
  const CategoryAddPage({super.key});

  @override
  State<CategoryAddPage> createState() => _CategoryAddPage();
}

class _CategoryAddPage extends State<CategoryAddPage> {
  final _formKey = GlobalKey<FormState>();

  final _categoryTitleController = TextEditingController();
  final _categoryDescriptionContoller = TextEditingController();
  bool _status = true;

  @override
  void dispose() {
    _categoryTitleController.dispose();
    _categoryDescriptionContoller.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final categoryTitle = _categoryTitleController.text.trim();
    final categoryDescription = _categoryDescriptionContoller.text.trim();

    final provider = context.read<CategoryProvider>();

    if (provider.isTitleExists(categoryTitle)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppStrings.tr(context, 'snack3'),
          ),
        ),
      );
      return;
    }

    final category = CategoryModel(
      categoryId: DateTime.now().millisecondsSinceEpoch.toString(),
      categoryTitle: categoryTitle,
      categoryDescription: categoryDescription,
    );

    provider.addCategory(category);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.tr(context, 'addCategory'))),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _categoryTitleController,
                decoration: const InputDecoration(
                  labelText: 'Kategori Adı',
                  border: OutlineInputBorder(),
                ),
                validator: CategoryValidator.validateCategoryTitle,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _categoryDescriptionContoller,
                decoration: const InputDecoration(
                  labelText: 'Kategori Açıklaması',
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
                child: Text(AppStrings.tr(context, 'addButton')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
