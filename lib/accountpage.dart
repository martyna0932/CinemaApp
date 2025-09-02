import 'package:flutter/material.dart';
import 'widget/account_appbar.dart';
import 'widget/footer.dart';
import 'features/data_tab.dart';
import 'features/history_tab.dart';
import 'features/coupon_tab.dart';

class AccountPage extends StatefulWidget {
  final String email;

  const AccountPage({super.key, required this.email});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
                    "Twoje konto",
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
                Tab(icon: Icon(Icons.person), text: "Dane użytkownika"),
                Tab(icon: Icon(Icons.history), text: "Historia"),
                Tab(icon: Icon(Icons.local_offer), text: "Kupony"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  UserDataTab(email: widget.email),
                  const HistoryTab(),   
                  CouponsTab(),        
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
