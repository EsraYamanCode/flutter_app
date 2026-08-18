import 'package:flutter/material.dart';
import 'package:flutter_deneme/core/validators/category_validator.dart';
import 'package:flutter_deneme/data/models/category_model.dart';
import 'package:flutter_deneme/features/categories/category_provider.dart';
import 'package:provider/provider.dart';

class CategoryEditPage extends StatefulWidget {
  final CategoryModel category;
  const CategoryEditPage({super.key, required this.category});

  @override
  State<CategoryEditPage> createState() => _CategoryEditPageState();
}

class _CategoryEditPageState extends State<CategoryEditPage> {
  final _formKey = GlobalKey<FormState>();

  final _categoryTitleController = TextEditingController();
  final _categoryDescriptionController = TextEditingController();
  bool _status = true;

  void _submitForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final provider = context.read<CategoryProvider>();
    final bool isUnique = provider.isTitleExists(
      _categoryTitleController.text.trim(),
      currentCategoryId: widget.category.categoryId,
    );

    if (isUnique) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('This username already taken.')),
      );
      return;
    }

    final CategoryModel updatedCategory = widget.category.copyWith(
      categoryTitle: _categoryTitleController.text.trim(),
      categoryDescription: _categoryDescriptionController.text.trim(),
      status: _status,
    );
    provider.updateCategory(updatedCategory);
    Navigator.pop(context, true);
  }

  @override
  void initState() {
    super.initState();
    _categoryTitleController.text = widget.category.categoryTitle;
    _categoryDescriptionController.text = widget.category.categoryDescription;
    _status = widget.category.status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EDİT USER')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _categoryTitleController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                validator: CategoryValidator.validateCategoryTitle,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _categoryDescriptionController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
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
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('EDİT CATEGORY'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
