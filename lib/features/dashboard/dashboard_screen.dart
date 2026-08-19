import 'package:flutter/material.dart';
import 'package:flutter_deneme/features/categories/category_page.dart';
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
    CategoryManagement(),
    ProductManagement(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🪼​'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 30, 57, 75),
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
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.people, color: Color.fromARGB(255, 215, 207, 191)),
            label: "Users",
          ),
          NavigationDestination(
            icon: Icon(
              Icons.category,
              color: Color.fromARGB(255, 215, 207, 191),
            ),
            label: "Categories",
          ),
          NavigationDestination(
            icon: Icon(
              Icons.shopping_bag,
              color: Color.fromARGB(255, 215, 207, 191),
            ),
            label: "Products",
          ),
        ],
      ),
    );
  }
}
