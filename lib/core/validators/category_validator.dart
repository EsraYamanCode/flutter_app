class CategoryValidator {
  static String? validateCategoryTitle(String? value) {
    if (value == null || value.isEmpty) {
      return 'CategoryTitle cannot be empty';
    }
    if (value.contains(' ')) {
      return 'CategoryTitle cannot contains space';
    }
    return null;
  }
}
