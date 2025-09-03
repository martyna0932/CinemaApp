import 'package:flutter/material.dart';
import '../widget/appbar.dart';
import '../widget/footer.dart';
import '../purchasepage.dart';

class OfertaPage extends StatelessWidget {
  const OfertaPage({super.key});

  final List<Map<String, String>> ofertaItems = const [
    {"title": "Bilet Rodzinny", "image": "assets/images/ai1.png", "desc": "2+2 w promocyjnej cenie"},
    {"title": "Weekendowy Maraton", "image": "assets/images/ai2.png", "desc": "3 filmy w jednym dniu"},
    {"title": "Happy Hours", "image": "assets/images/ai3.png", "desc": "Zniżka na seanse popołudniowe"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPage(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            const Text("Oferty Specjalne 🎁",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.orange)),
            const SizedBox(height: 24),
            ...ofertaItems.map((item) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Card(
                  color: Colors.grey[900],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
                        child: Image.network(
                          item["image"]!,
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.error, color: Colors.red),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item["title"]!,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                            const SizedBox(height: 8),
                            Text(item["desc"]!, style: const TextStyle(color: Colors.white70)),
                            const SizedBox(height: 12),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Purchasepage(
                                          )),
                                );
                              },
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                              child: const Text("Kup", style: TextStyle(color: Colors.white),),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
            const SizedBox(height: 48),
            const FooterPage(),
          ],
        ),
      ),
    );
  }
}
