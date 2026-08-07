import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("😺  D&R Admin"),

        // appBar kısmı logo şeklinde olsun
      ),
      body: Center(child: Text("dashboard")),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
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
