import 'package:cinema_app/main_page.dart';
import 'package:flutter/material.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinema City Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.dark(
          primary: Colors.orange.shade700,
          secondary: Colors.deepOrange,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 12, 12),
        title: Row(
          children: [
            const Icon(Icons.local_movies, size: 30, color:  Color.fromARGB(255, 237, 119, 1)),
            const SizedBox(width: 8),

            TextButton(
              style: ButtonStyle(overlayColor: WidgetStateProperty.all(Colors.transparent)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CinemaCityClone()),
                      );
                    },
              child: Text('Cinema City', style: TextStyle(color:  Color.fromARGB(255, 255, 255, 255), fontSize: 24 ),),
            ),


            const Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                   onPressed: () {},
                  child: const Text('Język', style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Logowanie', style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Rejestracja', style: TextStyle(color: Colors.white)),
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
                TextButton(
                  onPressed: () {},
                  child: const Text('REPERTUAR', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('OFERTY', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('BAR KINOWY', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('NOWOŚCI', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('PREZENTY', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('VIP', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           
          
            Container(
            color: Colors.black,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Główne kolumny z kategoriami
                Wrap(
                  spacing: 32,
                  runSpacing: 24,
                  alignment: WrapAlignment.center,
                  children: [
                    _footerColumn('O nas', [
                      'Kim jesteśmy',
                      'Kariera',
                      'Kontakt',
                    ]),
                    _footerColumn('Pomoc', [
                      'FAQ',
                      'Regulamin',
                      'Polityka prywatności',
                    ]),
                    _footerColumn('Usługi', [
                      'Zakup biletów',
                      'Karta lojalnościowa',
                      'Prezent VIP',
                    ]),
                    _footerColumn('Media społecznościowe', [
                      'Facebook',
                      'Instagram',
                      'YouTube',
                    ]),
                  ],
                ),
                const SizedBox(height: 32),
                // Zmiana języka / kraju
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.language, color: Colors.white),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Polska | PL',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  '© 2025 Cinema City Clone. Wszelkie prawa zastrzeżone.',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          )

          ],
        ),
      ),
    );
  }

  Widget _footerColumn(String title, List<String> links) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      const SizedBox(height: 8),
      for (var link in links)
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            alignment: Alignment.centerLeft,
          ),
          child: Text(
            link,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ),
    ],
  );
}


}
