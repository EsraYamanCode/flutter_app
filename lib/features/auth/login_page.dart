import 'package:flutter/material.dart';
import 'package:flutter_deneme/features/dashboard/dashboard_screen.dart';
import 'package:flutter_deneme/features/users/user_provider.dart';
import 'package:provider/provider.dart';
import '../../core/localization/app_strings.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _tryLogin() {
    final provider = context.read<UserProvider>();
    final username = _usernameController.text.trim();
    final password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppStrings.tr(context, 'snack5', listen: false)),
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    final user = provider.login(username, password);

    setState(() => _isLoading = false);

    if (user != null) {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (_) => const DashboardScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppStrings.tr(context, 'snack4', listen: false)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 30, 57, 75),
          ),
        ),
        title: const Center(
          child: Text(
            "Login Page",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 100),
            TextField(
              //controller koy
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: AppStrings.tr(context, 'username'),
                border: OutlineInputBorder(),
                hoverColor: Color.fromARGB(255, 215, 207, 191),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              //kontroller koy
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: AppStrings.tr(context, 'password'),
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _tryLogin,
                child: _isLoading
                    ? const SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
