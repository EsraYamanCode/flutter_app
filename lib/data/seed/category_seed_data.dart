import '../models/category_model.dart';

class CategorySeedData {
  static List<CategoryModel> initialCategories = [
    CategoryModel(
      categoryId: "1",
      categoryTitle: "Kitap",
      categoryDescription: "Roman, bilim kurgu, kişisel gelişim kitapları",
      status: true,
      isDeleted: false,
    ),
    CategoryModel(
      categoryId: "2",
      categoryTitle: "Kırtasiye",
      categoryDescription: "Defter, kalem ve ofis gereçleri",
      status: true,
      isDeleted: false,
    ),
    CategoryModel(
      categoryId: "3",
      categoryTitle: "Elektronik",
      categoryDescription: "E-kitap okuyucu, kulaklık ve aksesuarlar",
      status: true,
      isDeleted: false,
    ),
  ];
}
