import '../models/user_model.dart';

class SeedData {
  static List<UserModel> intialUsers = [
    UserModel(
      id: "1",
      username: "admin",
      userTitle: "Admin User",
      password: "admin123",
      isDeleted: false,
    ),
  ];
}
