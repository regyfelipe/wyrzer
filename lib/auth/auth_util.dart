import 'dart:io';

class AuthUtil {
  static String? validateEmail(String value) {
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(value)) {
      return 'Digite um e-mail válido';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.length < 6) {
      return 'A senha deve ter pelo menos 6 caracteres';
    }
    return null;
  }

  static bool isFileExists(String filePath) {
    final file = File(filePath);
    return file.existsSync();
  }
}
