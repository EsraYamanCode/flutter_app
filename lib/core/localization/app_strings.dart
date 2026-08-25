import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'locale_provider.dart';

class AppStrings {
  static const Map<String, Map<String, String>> _values = {
    'tr': {
      "loginTitle": "Giriş Yap",
      "username": "Kullanıcı Adı",
      "userTitle": "Kullanıcı Ünvanı",
      "password": "Şifre",
      "loginButton": "Giriş",
      "addProduct": "Ürün Ekle",
      "addUser": "Kullanıcı Ekle",
      "editUser": "Kullanıcı Düzenleme",
      "edit": "DÜZENLE",
      "snack1": "Başarıyla güncellendi",
      "snack2": "Bu kullanıcı kullanılmaktadır",
      "delete": "Silmek istediğine emin misin?",
      "yes": "Evet",
      "no": "Hayır",
      "editCategory": "Kategori Düzenle",
      "snack3": "Bu kategori kullanılmaktadır.",
      "addCategory": "Kategori Ekle",
      "noCategory": "Kategori Yok",
      "assignCategory": "Kategori Ata",
      "addButton": "EKLE",
      "active": "Aktif",
      "passive": "Pasif",
      "okey": "Tamam",
      "to_inform": "Bilgilendirme",
      "description":
          "Ürün düzenleme özelliği bu aşamada zorunlu kapsam dışındadır.",
      "user": "KULLANICILAR",
      "category": "KATEGORİLER",
      "product": "ÜRÜNLER",
      "snack4": "Hata: Kullanıcı bulunamadı veya şifre yanlış.",
      "snack5": "Lütfen kullanıcı adı ve şifreyi giriniz.",
    },
    'en': {
      "loginTitle": "Login Page",
      "username": "Username",
      "userTitle": "User Title",
      "password": "Password",
      "loginButton": "Login",
      "addProduct": "Add Product",
      "addUser": "Add User",
      "editUser": "Edit User",
      "edit": "EDIT",
      "snack1": "User successfully updated.",
      "snack2": "This user is in use.",
      "delete": "Are you sure delete?",
      "yes": "Yes",
      "no": "No",
      "editCategory": "Edit Category",
      "snack3": "This category is in use.",
      "addCategory": "Add Category",
      "noCategory": "No category",
      "assignCategory": "Assign category",
      "addButton": "ADD",
      "active": "Active",
      "passive": "Passive",
      "okey": "Okey",
      "to_inform": "To Inform",
      "description":
          "The product editing feature is excluded from the scope at this stage.",
      "user": "USERS",
      "category": "CATEGORİES",
      "product": "PRODUCTS",
      "snack4": "Failed: user didnt find or password is wrong.",
      "snack5": "Please enter username and password.",
    },
  };

  // Sayfalardan kolayca kelime çekmek için yardımcı metot:
  static String tr(BuildContext context, String key, {bool listen = false}) {
    final lang = listen
        ? context.watch<LocaleProvider>().currentLocale
        : context.read<LocaleProvider>().currentLocale;
    return _values[lang]?[key] ?? key;
  }
}
