abstract class ValidatorUtil {
  static String? validateNewPassword(String? value) {
    final requiredField = validateRequiredField(field: 'Password', value: value);

    if (requiredField != null) {
      return requiredField;
    }

    if (value!.length < 6) {
      return 'Password must be at least 6 characters long';
    }

    if (value.length > 49) {
      return 'Password must be at most 49 characters long';
    }

    // if (!RegExp(r'^[a-zA-Z0-9!@#\$%^&*()\-_=+|{};:?.,~`]+$').hasMatch(value)) {
    //   return LocaleKeys.auth_password_special_symbol.tr(args: [r'(e.g. !, @, #, $, %, ^, &, *)']);
    // }

    return null;
  }

  static String? validateEmail(String? value) {
    final requiredField = validateRequiredField(field: 'Email', value: value);

    if (requiredField != null) {
      return requiredField;
    }

    if (!value!.trim().contains('@')) {
      return 'Invalid email address';
    }

    return null;
  }

  static String? validateRequiredField({required String field, required String? value}) {
    if (value == null || value.isEmpty) {
      return '$field is required';
    }

    return null;
  }

  static const int _minPasswordLength = 8;

  static bool hasMinPasswordLength(String password) => password.length >= _minPasswordLength;

  static bool hasPasswordDigit(String password) => RegExp('[0-9]').hasMatch(password);

  static bool hasPasswordUppercase(String password) => RegExp('[A-Z]').hasMatch(password);

  static (int, String) checkPasswordStrength(String password) {
    var level = 0;

    if (password.isEmpty || password.length < 6) {
      return (0, ''); // No Level
    }

    if (password.length >= 6) {
      level += 1; // At least 6 characters, unsafe

      if (RegExp('[0-9]').hasMatch(password)) {
        level += 1; // Contains number
      }
      if (RegExp('[A-Z]').hasMatch(password)) {
        level += 1; // Contains uppercase letter
      }
      if (RegExp(r'[!@#\$%^&*()\-_=+|{};:?.,~`]').hasMatch(password)) {
        level += 1; // Contains special character
      }
    }

    return (level, '');
  }
}
