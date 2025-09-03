import 'package:flutter/material.dart';
import 'package:cinema_app/data/appdata.dart';
import 'widget/account_appbar.dart';
import 'widget/footer.dart';
import 'features/password_tab.dart';
import 'features/history_tab.dart';
import 'features/coupon_tab.dart';

class PasswordPage extends StatefulWidget {
  final String email;

  const PasswordPage({super.key, required this.email});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
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
                  PasswordChangeTab(email: AppData.email),
                  const HistoryTab(),
                  const CouponsTab(),
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
}
