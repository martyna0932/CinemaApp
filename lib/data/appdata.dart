import 'package:shared_preferences/shared_preferences.dart';

class AppData {
  static String email = "test@kino.pl";
  static String password = "123456";

  // 🔹 Zapisz hasło do SharedPreferences
  static Future<void> savePassword(String newPassword) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('password', newPassword);
    password = newPassword; // zaktualizuj też w AppData
  }

  // 🔹 Wczytaj hasło przy starcie aplikacji
  static Future<void> loadPassword() async {
    final prefs = await SharedPreferences.getInstance();
    password = prefs.getString('password') ?? password;
  }
}
