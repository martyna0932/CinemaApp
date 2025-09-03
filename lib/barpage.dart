import 'package:flutter/material.dart';
import '../widget/appbar.dart';
import '../widget/footer.dart';

class BarKinowyPage extends StatelessWidget {
  const BarKinowyPage({super.key});

  final List<Map<String, String>> barItems = const [
    {"title": "Popcorn", "image": "assets/images/popcorn.png", "price": "15 zł"},
    {"title": "Napój Cola", "image": "assets/images/cola.png", "price": "8 zł"},
    {"title": "Nachosy", "image": "assets/images/nachos.png", "price": "12 zł"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPage(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            const Text("Bar Kinowy 🍿",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.orange)),
            const SizedBox(height: 24),
            ...barItems.map((item) {
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
                          width: 100,
                          height: 100,
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
                            Text(item["price"]!, style: const TextStyle(color: Colors.white70)),
                            const SizedBox(height: 12),
                            /*ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                              child: const Text("Kup"),
                            ),*/
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
