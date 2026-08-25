import 'package:flutter/material.dart';
import 'package:flutter_deneme/core/localization/locale_provider.dart';
import 'package:flutter_deneme/features/categories/category_page.dart';
import 'package:flutter_deneme/features/products/products_page.dart';
import 'package:flutter_deneme/features/users/admin_user_page.dart';
import 'package:provider/provider.dart';
import '../../core/localization/app_strings.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;
  final pages = [
    AdminUserManagement(),
    CategoryManagement(),
    ProductManagement(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YÖNETİM PANELİ​',
          style: TextStyle(color: Color.fromARGB(255, 215, 207, 191)),
        ),
        shadowColor: Color.fromARGB(255, 215, 207, 191),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 30, 57, 75),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.language,
              color: Color.fromARGB(255, 215, 207, 191),
            ),
            onPressed: () {
              final currentLang = context.read<LocaleProvider>().currentLocale;
              if (currentLang == 'tr') {
                context.read<LocaleProvider>().setLocale('en');
              } else {
                context.read<LocaleProvider>().setLocale('tr');
              }
            },
          ),
        ],
      ),
      body: pages[currentIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Color.fromARGB(255, 30, 57, 75),
        indicatorColor: const Color.fromARGB(255, 108, 94, 79),
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.people, color: Color.fromARGB(255, 215, 207, 191)),
            label: (AppStrings.tr(context, 'user')),
          ),
          NavigationDestination(
            icon: Icon(
              Icons.category,
              color: Color.fromARGB(255, 215, 207, 191),
            ),
            label: (AppStrings.tr(context, 'category')),
          ),
          NavigationDestination(
            icon: Icon(
              Icons.shopping_bag,
              color: Color.fromARGB(255, 215, 207, 191),
            ),
            label: (AppStrings.tr(context, 'product')),
          ),
        ],
      ),
    );
  }
}
