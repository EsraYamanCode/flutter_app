import 'package:flutter_deneme/data/repositories/category_repository.dart';
import 'package:flutter_deneme/data/repositories/product_repository.dart';
import 'package:flutter_deneme/data/repositories/user_repository.dart';
import 'package:flutter_deneme/features/categories/category_provider.dart';
import 'package:flutter_deneme/features/products/product_provider.dart';
import 'package:flutter_deneme/features/users/user_provider.dart';
import 'package:flutter_deneme/core/localization/locale_provider.dart';
import 'package:provider/provider.dart';
import 'features/auth/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider(UserRepository())),
        ChangeNotifierProvider(
          create: (_) => CategoryProvider(CategoryRepository()),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductProvider(ProductRepository()),
        ),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
