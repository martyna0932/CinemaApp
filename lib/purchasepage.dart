import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'widget/appbar.dart';
import 'widget/footer.dart';

class Purchasepage extends StatefulWidget {
  const Purchasepage({super.key});

  @override
  State<Purchasepage> createState() => _PurchasepageState();
}

class _PurchasepageState extends State<Purchasepage> {
  String? selectedMovie;
  DateTime? selectedDate;
  int tickets = 1;

  Future<void> _reserveTickets() async {
    if (selectedMovie == null || selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Uzupełnij wszystkie pola!")),
      );
      return;
    }

    await FirebaseFirestore.instance.collection('reservations').add({
      'movie': selectedMovie,
      'date': selectedDate,
      'tickets': tickets,
      'createdAt': Timestamp.now(),
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Rezerwacja zapisana ✅")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPage(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 32),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Rezerwacja biletów",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  // wybór filmu z Firestore
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('movies').snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return const CircularProgressIndicator();
                      final movies = snapshot.data!.docs;
                      return DropdownButtonFormField<String>(
                        decoration: const InputDecoration(labelText: "Wybierz film"),
                        value: selectedMovie,
                        items: movies.map((doc) {
                          return DropdownMenuItem<String>(
                            value: doc['title'],
                            child: Text(doc['title']),
                          );
                        }).toList(),
                        onChanged: (val) => setState(() => selectedMovie = val),
                      );
                    },
                  ),
                  const SizedBox(height: 20),

                  // wybór daty
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          selectedDate == null
                              ? "Wybierz datę seansu"
                              : "Data: ${selectedDate!.day}.${selectedDate!.month}.${selectedDate!.year}",
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(const Duration(days: 60)),
                          );
                          if (date != null) {
                            setState(() => selectedDate = date);
                          }
                        },
                        child: const Text("Wybierz"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // liczba biletów
                  Row(
                    children: [
                      const Text("Liczba biletów: "),
                      IconButton(
                        onPressed: () {
                          if (tickets > 1) setState(() => tickets--);
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      Text("$tickets", style: const TextStyle(fontSize: 18)),
                      IconButton(
                        onPressed: () {
                          setState(() => tickets++);
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // przycisk rezerwacji
                  Center(
                    child: ElevatedButton(
                      onPressed: _reserveTickets,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 237, 119, 1),
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      ),
                      child: const Text("Rezerwuj", style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 48),
            const FooterPage(),
          ],
        ),
      ),
    );
  }
}
