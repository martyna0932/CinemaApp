import 'package:flutter/material.dart';
import 'package:cinema_app/data/appdata.dart';
import 'package:cinema_app/passwordchange.dart';


class UserDataTab extends StatelessWidget {
  final String email;

  const UserDataTab({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Adres e-mail
          ListTile(
            leading: const Icon(Icons.email, color: Colors.orange),
            title: const Text("Adres e-mail", style: TextStyle(color: Colors.white)),
            subtitle: Text(AppData.email, style: const TextStyle(color: Colors.white70)),
          ),
          const SizedBox(height: 16),
          // Hasło z przyciskiem pod spodem
          ListTile(
            leading: const Icon(Icons.lock, color: Colors.orange),
            title: const Text("Hasło", style: TextStyle(color: Colors.white)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppData.password.replaceAll(RegExp(r"."), "*"),
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PasswordPage(email: email),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  child: const Text(
                    "Zmień hasło",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
