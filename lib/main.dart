import 'package:flutter/material.dart';
import 'package:flutter_deneme/features/categories/categories_page.dart';
import 'package:flutter_deneme/features/products/products_page.dart';
import 'package:flutter_deneme/features/users/admin_user_page.dart';
import 'package:flutter_deneme/features/users/user_add_page.dart';
import 'features/auth/login_page.dart';
import 'features/dashboard/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override //buraya appBar ve navBar ekleki o kısım kalsın sadece diğer şeyler değişsin.
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginPage());
  }
}
