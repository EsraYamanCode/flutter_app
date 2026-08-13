import 'package:flutter_deneme/data/repositories/user_repository.dart';
import 'package:flutter_deneme/features/users/admin_user_page.dart';
import 'package:flutter_deneme/features/users/user_provider.dart';
import 'package:provider/provider.dart';
import 'features/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deneme/features/dashboard/dashboard_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => UserProvider(UserRepository()),
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
