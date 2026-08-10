import 'package:flutter/material.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/user_repository.dart';

class UserProvider extends ChangeNotifier {
  final UserRepository _repository;

  UserProvider(this._repository);

  List<UserModel> get users => _repository.users;

  bool isUsernameUnique(String username, {String? currentUserId}) {
    return _repository.isUsernameUnique(username, currentUserId: currentUserId);
  }

  void addUser(UserModel user) {
    _repository.addUser(user);
    notifyListeners();
  }

  void updateUser(UserModel user) {
    _repository.updateUser(user);
    notifyListeners();
  }

  void deleteUser(String id) {
    _repository.deleteUser(id);
    notifyListeners();
  }
}
