import '../models/category_model.dart';

class CategorySeedData {
  static List<CategoryModel> initialCategories = [
    CategoryModel(
      CategoryId: "cat-1",
      CategoryTitle: "Kitap",
      CategoryDescription: "Roman, bilim kurgu, kişisel gelişim kitapları",
      Status: true,
      isDeleted: false,
    ),
    CategoryModel(
      CategoryId: "cat-2",
      CategoryTitle: "Kırtasiye",
      CategoryDescription: "Defter, kalem ve ofis gereçleri",
      Status: true,
      isDeleted: false,
    ),
    CategoryModel(
      CategoryId: "cat-2",
      CategoryTitle: "Elektronik",
      CategoryDescription: "E-kitap okuyucu, kulaklık ve aksesuarlar",
      Status: true,
      isDeleted: false,
    ),
  ];
}