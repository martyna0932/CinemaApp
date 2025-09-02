import 'package:cinema_app/accountpage.dart';
import 'package:flutter/material.dart';
import '../main_page.dart';
import '../loginpage.dart';
import 'package:cinema_app/data/appdata.dart';



class AppBarPage_account extends StatelessWidget implements PreferredSizeWidget {
  const AppBarPage_account({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 48);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 12, 12, 12),
      title: Row(
        children: [
          const Icon(Icons.local_movies, size: 30, color: Color.fromARGB(255, 237, 119, 1)),
          const SizedBox(width: 8),
          TextButton(
            style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.transparent)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CinemaCityClone()),
              );
            },
            child: const Text(
              'Cinema City',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  AccountPage(email: AppData.email)));
                },
                child: const Text('Konto', style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                },
                child: const Text('Wyloguj', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: Container(
          color: const Color.fromARGB(255, 237, 119, 1),
          height: 48,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var label in ['REPERTUAR', 'OFERTY', 'BAR KINOWY', 'NOWOŚCI', 'PREZENTY', 'VIP'])
                TextButton(
                  onPressed: () {},
                  child: Text(
                    label,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
