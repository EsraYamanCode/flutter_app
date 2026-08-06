class UserValidator {
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      //username boş olursa;
      return 'Username cannot be empty';
    }
    if (value.contains(' ')) {
      //username boşluk içeriyorsa;
      return 'Username cannot contain spaces';
    }
    final RegExp usernameRegExp = RegExp(
      r'^[a-zA-Z0-9_]+$',
    ); //RegExp değişkenimiz sadece bu değerleri alabilir.
    if (!usernameRegExp.hasMatch(value)) {
      return 'Username can only contain letters, numbers, and underscores';
    }
    return null;
  }

  static String? validateUserTitle(String? value) {
    if (value == null || value.isEmpty) {
      return 'User title cannot be empty';
    }
    return null;
  }

  static String? validatePassword(String? value, {bool isEditing = false}) {
    if (isEditing && (value == null || value.isEmpty)) {
      //şifre düzenlenirken boş bırakılırsa;
      return 'Password cannot be empty';
    }
    if (value == null || value.isEmpty) {
      //şifre boş olursa;
      return 'Password cannot be empty';
    }
    if (value.length < 6) {
      //şifre 6 karakterden kısa olursa;
      return 'Password must be at least 6 characters long';
    }
    return null;
  }
}
