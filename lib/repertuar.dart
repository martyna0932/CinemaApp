import 'package:flutter/material.dart';
import '../widget/appbar.dart';
import '../widget/footer.dart';
import '../purchasepage.dart'; // żeby można było przejść do zakupu biletu

class RepertuarPage extends StatelessWidget {
  const RepertuarPage({super.key});

  // Lista filmów z repertuaru
  final List<Map<String, dynamic>> repertuar = const [
    {
      "title": "Avatar 2",
      "image": "assets/images/1.png",
      "hours": ["12:00", "15:30", "19:00"]
    },
    {
      "title": "Batman",
      "image": "assets/images/2.png",
      "hours": ["11:00", "14:00", "18:30", "21:00"]
    },
    {
      "title": "Joker 2",
      "image": "assets/images/3.png",
      "hours": ["10:00", "13:30", "17:00", "20:00"]
    },
    {
      "title": "Dune Part 2",
      "image": "assets/images/12.png",
      "hours": ["16:00", "19:30", "22:00"]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPage(), // Twój AppBar
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            const Text(
              "Repertuar Kina 🎬",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 237, 119, 1),
              ),
            ),
            const SizedBox(height: 24),

            // Lista filmów
            ...repertuar.map((film) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Card(
                  color: Colors.grey[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      // Plakat
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                        child: Image.network(
                          film["image"],
                          width: 120,
                          height: 180,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.error, color: Colors.red),
                        ),
                      ),

                      const SizedBox(width: 16),

                      // Tytuł i godziny
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              film["title"],
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),

                            Wrap(
                              spacing: 8,
                              children: (film["hours"] as List<String>).map((hour) {
                                return Chip(
                                  label: Text(hour),
                                  backgroundColor: Colors.orange.shade700,
                                  labelStyle: const TextStyle(color: Colors.white),
                                );
                              }).toList(),
                            ),

                            const SizedBox(height: 12),

                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Purchasepage(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 237, 119, 1),
                              ),
                              child: const Text("Kup bilet", style: TextStyle(color: Colors.white),),
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
            const FooterPage(), // Twój Footer
          ],
        ),
      ),
    );
  }
}
