import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_deneme/data/models/user_model.dart';
import 'package:flutter_deneme/features/users/user_provider.dart';
import '../../core/validators/user_validator.dart';
import '../../core/localization/app_strings.dart';


class UserEditPage extends StatefulWidget {
  final UserModel user; //gelecek olan user'ın tipi UserModel.
  const UserEditPage({
    super.key,
    required this.user, //bu sayfayı açarken user vermek zorundasın demek bu.
  });

  @override
  State<UserEditPage> createState() => _UserEditPageState();
}

class _UserEditPageState extends State<UserEditPage> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _userTitleController = TextEditingController();
  final _passwordController = TextEditingController();

  void _submitForm() {
    if (!_formKey.currentState!.validate()) {
      //Formu kontrol et. Geçerli değilse burada dur, aşağıdaki işlemleri yapma.
      return;
    }
    final provider = context.read<UserProvider>();
    final bool isUnique = provider.isUsernameUnique(
      _usernameController.text.trim(),
      currentUserId: widget.user.id,
    );

    if (!isUnique) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Bu isim kullanılmakta.')));
      return;
    }

    if (_passwordController.text.trim().isNotEmpty &&
        _passwordController.text.trim().length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Şİfre en az 6 karakter olmalı.')),
      );
      return;
    }

    final UserModel updatedUser = widget.user.copyWith(
      username: _usernameController.text.trim(),
      userTitle: _userTitleController.text.trim(),
      password: _passwordController.text.trim().isEmpty
          ? widget.user.password
          : _passwordController.text.trim(),
    );
    provider.updateUser(updatedUser);
    Navigator.pop(context, true);
  }

  @override
  void initState() {
    super.initState();
    _usernameController.text = widget.user.username;
    _userTitleController.text = widget.user.userTitle;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.tr(context, 'editUser'))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                validator: UserValidator.validateUsername,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _userTitleController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                validator: UserValidator.validateUserTitle,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text(AppStrings.tr(context, 'edit')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
