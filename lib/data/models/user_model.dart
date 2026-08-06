class UserModel {
  final String id;
  final String username; //unique olucak
  final String userTitle;
  final String password; //şifre için gerekli talimatları unutma.
  final bool isDeleted; //soft delete olucak

  UserModel({
    required this.id,
    required this.username,
    required this.userTitle,
    required this.password,
    this.isDeleted = false,
  });

  UserModel copyWith({
    String? id,
    String? username,
    String? userTitle,
    String? password,
    bool? isDeleted,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      userTitle: userTitle ?? this.userTitle,
      password: password ?? this.password,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}
