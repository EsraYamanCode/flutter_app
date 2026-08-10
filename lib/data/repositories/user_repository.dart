import 'package:flutter/material.dart';
import '../models/user_model.dart'; //bu kullanılan voidların kullanımına bir daha dikkat et!!!
import '../seed/seed_data.dart';

class UserRepository extends ChangeNotifier { // ChangeNotifier, bir değişiklik olduğunda ilgili widget'ı haber eder.
  final List<UserModel> _users = List.from(SeedData.initialUsers);

  List<UserModel> get users => _users.where((user) => !user.isDeleted).toList();

  bool isUsernameUnique(String username, {String? currentUserId}) {
    return !_users.any(
      (u) =>
          !u.isDeleted &&
          u.username.toLowerCase() == username.toLowerCase() &&
          u.id != currentUserId,
    );
  }

  void addUser(UserModel user) {
    _users.add(user);
    notifyListeners(); 
  }

  void updateUser(UserModel updatedUser) { 
    final index = _users.indexWhere((u) => u.id == updatedUser.id);
    if (index != -1) {
      _users[index] = updatedUser;
      notifyListeners(); // ekranı güncellemek için çağrılır.
    }
  }

  void deleteUser(String id) {
    final index = _users.indexWhere((u) => u.id == id);
    if (index != -1) {
      // Fiziki silme yerine isDeleted bayrağı true yapılır
      _users[index] = _users[index].copyWith(isDeleted: true);
      notifyListeners();
    }
  }

  UserModel? login(String username, String password) {
    try {
      return _users.firstWhere(
        (u) => !u.isDeleted && u.username == username && u.password == password,
      );
    } catch (_) {
      return null; // Kullanıcı bulunamadı veya hatalı şifre
    }
  }
}
