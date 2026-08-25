import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/validators/user_validator.dart';
import '../../data/models/user_model.dart';
import '../users/user_provider.dart';
import '../../core/localization/app_strings.dart';

class UserAddPage extends StatefulWidget {
  const UserAddPage({super.key});

  @override
  State<UserAddPage> createState() => _UserAddPageState();
}

class _UserAddPageState extends State<UserAddPage> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _userTitleController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _userTitleController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final username = _usernameController.text.trim();
    final userTitle = _userTitleController.text.trim();
    final password = _passwordController.text;

    final provider = context.read<UserProvider>();

    if (!provider.isUsernameUnique(username)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('This username already taken.')),
      );
      return;
    }

    final user = UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      username: username,
      userTitle: userTitle,
      password: password,
    );
    provider.addUser(user);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.tr(context, 'addUser')),
      ), // + butonunda Navigator.push yaptığımız için Flutter yeni sayfayı navigation stack'e ekledi;
      // appBar'da bu sayfanın geri dönülebilir olduğunu anlayıp geri okunu otomatik olarak gösterdi ve geri yaptığımızda girdiğimiz sayfadan çıkıp stack'ten çıkarıyor.
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: AppStrings.tr(context, 'username'),
                  border: OutlineInputBorder(),
                ),
                validator: UserValidator.validateUsername,
              ),

              const SizedBox(height: 16),
              TextFormField(
                controller: _userTitleController,
                decoration: InputDecoration(
                  labelText: AppStrings.tr(context, 'userTitle'),
                  border: OutlineInputBorder(),
                ),
                validator: UserValidator.validateUserTitle,
              ),

              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: AppStrings.tr(context, 'password'),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                validator: UserValidator.validatePassword,
              ),

              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text(AppStrings.tr(context, 'addButton')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
