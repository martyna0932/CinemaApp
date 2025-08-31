import 'package:flutter/material.dart';
import 'package:cinema_app/data/appdata.dart';
import 'widget/account_appbar.dart';
import 'widget/footer.dart';

class PasswordPage extends StatefulWidget {
  final String email;

  const PasswordPage({super.key, required this.email});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final TextEditingController _passwordController = TextEditingController();
  final Map<String, String> _couponCodes = {};

  String _generateCouponCode() {
    return (100000 + (DateTime.now().millisecondsSinceEpoch % 900000)).toString();
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
                    "Zarządzaj swoim kontem",
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
                Tab(icon: Icon(Icons.lock), text: "Zmiana hasła"),
                Tab(icon: Icon(Icons.history), text: "Historia"),
                Tab(icon: Icon(Icons.local_offer), text: "Kupony"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildPasswordChange(),
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

  // 🔹 Zakładka Zmiana hasła
  Widget _buildPasswordChange() {
    return Container(
      color: Colors.black,
      child: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    "Zmień hasło dla ${widget.email}",
                    style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Wpisz nowe hasło",
                      filled: true,
                      fillColor: const Color.fromARGB(255, 23, 23, 23),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_passwordController.text.isNotEmpty) {
                        // Zapisujemy nowe hasło
                        AppData.password = _passwordController.text;

                        // Czyścimy pole
                        _passwordController.clear();

                        // Komunikat o zmianie hasła
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Hasło zostało zmienione ✅"),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      minimumSize: const Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Zmień hasło",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 🔹 Historia (bez zmian)
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

  // 🔹 Kupony (bez zmian)
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
            color: const Color.fromARGB(255, 48, 48, 48),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(coupon, style: const TextStyle(color: Colors.white, fontSize: 16)),
                  const SizedBox(height: 10),
                  if (code != null)
                    Text(
                      "Kod: $code",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: code == null
                        ? () {
                            setState(() {
                              _couponCodes[coupon] = _generateCouponCode();
                            });
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: code == null ? Colors.black87 : Colors.orange,
                    ),
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
