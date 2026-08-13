import 'package:flutter/material.dart';
import 'package:flutter_deneme/features/categories/categories_page.dart';
import 'package:flutter_deneme/features/products/products_page.dart';
import 'package:flutter_deneme/features/users/admin_user_page.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;
  final pages = [
    AdminUserManagement(),
    CategoriesManagement(),
    ProductsManagement(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🪼​'),
        centerTitle: true,
      ),
      body: pages[currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.people), label: "Users"),
          NavigationDestination(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_bag),
            label: "Products",
          ),
        ],
      ),
    );
  }
}
