import 'package:cinema_app/data/appdata.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'widget/account_appbar.dart';
import 'widget/footer.dart';


class AccountPage extends StatefulWidget {
  final String email;

  const AccountPage({super.key, required this.email});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final _newPasswordController = TextEditingController();
  final Map<String, String> _couponCodes = {};

  String _generateCouponCode() {
    final random = Random();
    return (100000 + random.nextInt(900000)).toString();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: const AppBarPage_account(),
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: const Color.fromARGB(255, 17, 17, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Witaj, ${widget.email} 👋",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Twoje konto klienta",
                    style: TextStyle(color: Colors.orange, fontSize: 14),
                  ),
                ],
              ),
            ),
            const TabBar(
              indicatorColor: Colors.orange,
              labelColor: Colors.orange,
              unselectedLabelColor: Colors.white70,
              tabs: [
                Tab(icon: Icon(Icons.person), text: "Dane"),
                Tab(icon: Icon(Icons.history), text: "Historia"),
                Tab(icon: Icon(Icons.local_offer), text: "Kupony"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildUserData(),
                  _buildHistory(),
                  _buildCoupons(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: const SizedBox(
          height: 60,
          child: FooterPage(),
        ),
      ),
    );
  }

  // 🔹 Dane użytkownika
  Widget _buildUserData() {
    return Container(
      color: Colors.black,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.email, color: Colors.orange),
            title: const Text("Adres e-mail", style: TextStyle(color: Colors.white)),
            subtitle: Text(AppData.email, style: const TextStyle(color: Colors.white70)),
          ),
          ListTile(
            leading: const Icon(Icons.lock, color: Colors.orange),
            title: const Text("Hasło", style: TextStyle(color: Colors.white)),
            subtitle: Text(
              AppData.password.replaceAll(RegExp(r"."), "*"),
              style: const TextStyle(color: Colors.white70),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Zmień hasło:",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _newPasswordController,
            obscureText: true,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[900],
              labelText: "Nowe hasło",
              labelStyle: const TextStyle(color: Colors.white70),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
              onPressed: () async {
                if (_newPasswordController.text.isNotEmpty) {
                  await AppData.savePassword(_newPasswordController.text); // 🔹 zapis do SharedPreferences
                  _newPasswordController.clear();
                  setState(() {});
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Hasło zostało zmienione ✅"),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text("Zapisz hasło"),
            ),

        ],
      ),
    );
  }

  // 🔹 Historia rezerwacji
  Widget _buildHistory() {
    return Container(
      color: Colors.black,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            leading: Icon(Icons.movie, color: Colors.orange),
            title: Text("Avatar 2", style: TextStyle(color: Colors.white)),
            subtitle: Text("12.01.2024 • Sala 5 • 19:30", style: TextStyle(color: Colors.white70)),
          ),
          ListTile(
            leading: Icon(Icons.movie, color: Colors.orange),
            title: Text("Batman", style: TextStyle(color: Colors.white)),
            subtitle: Text("20.12.2023 • Sala 2 • 21:00", style: TextStyle(color: Colors.white70)),
          ),
        ],
      ),
    );
  }

  // 🔹 Kupony
  Widget _buildCoupons() {
    final coupons = [
      "🎟️ -20% na bilety w weekend",
      "🍿 Darmowy popcorn w poniedziałek",
    ];

    return Container(
      color: Colors.black,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: coupons.length,
        itemBuilder: (context, index) {
          final coupon = coupons[index];
          final code = _couponCodes[coupon];

          return Card(
            color: Colors.orange,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(coupon, style: const TextStyle(color: Colors.white, fontSize: 16)),
                  const SizedBox(height: 10),
                  if (code != null)
                    Text("Kod: $code",
                        style: const TextStyle(
                            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _couponCodes[coupon] = _generateCouponCode();
                      });
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
                    child: const Text("Generuj kod"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
