import '../models/user_model.dart';

class SeedData {
  //başlangıç verisi
  static List<UserModel> initialUsers = [
    UserModel(
      id: "1",
      username: "admin",
      userTitle: "Admin User",
      password: "admin123",
      isDeleted: false,
    ),
    UserModel(
      id: "2",
      username: "admin1",
      userTitle: "Admin User2",
      password: "admin123",
      isDeleted: false,
    ),
  ];
}
