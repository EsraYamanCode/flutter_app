import '../models/user_model.dart';

class SeedData { //başlangıç verisi 
  static List<UserModel> initialUsers = [
    UserModel(
      id: "1",
      username: "admin",
      userTitle: "Admin User",
      password: "admin123",
      isDeleted: false,
    ),
  ];
}
