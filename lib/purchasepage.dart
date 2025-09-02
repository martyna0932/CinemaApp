import 'package:flutter/material.dart';
import 'widget/appbar.dart';
import 'widget/footer.dart';

class Purchasepage extends StatefulWidget {
  const Purchasepage({super.key});

  @override
  State<Purchasepage> createState() => _PurchasepageState();
}

class _PurchasepageState extends State<Purchasepage> {
  String? _selectedFilm;
  String? _selectedTime;
  String? _selectedSeat;

  final films = ["Avatar 2", "Batman", "Joker 2"];
  final times = ["15:00", "18:00", "21:00"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPage(),
      body: SingleChildScrollView(   // 🔹 przewijalna zawartość
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            const Text("🎬 Wybierz film", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

            DropdownButton<String>(
              value: _selectedFilm,
              hint: const Text("Wybierz film"),
              items: films.map((f) => DropdownMenuItem(value: f, child: Text(f))).toList(),
              onChanged: (val) => setState(() => _selectedFilm = val),
            ),

            const SizedBox(height: 16),
            const Text("🕒 Wybierz godzinę", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

            DropdownButton<String>(
              value: _selectedTime,
              hint: const Text("Wybierz godzinę"),
              items: times.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
              onChanged: (val) => setState(() => _selectedTime = val),
            ),

            const SizedBox(height: 24),
            const Text("🎟️ Wybierz miejsce", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

            Padding(
  padding: const EdgeInsets.all(16),
  child: Center(
    child: SizedBox(
      width: 300, // 🔹 szerokość całej siatki (możesz zmienić np. na 350)
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8,          // 🔹 8 siedzeń w rzędzie
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          childAspectRatio: 1,        // 🔹 kwadraciki, ale mniejsze
        ),
        itemCount: 40, // np. 40 miejsc
        itemBuilder: (context, index) {
          final seat = "Miejsce ${index + 1}";
          final isSelected = _selectedSeat == seat;
          return GestureDetector(
            onTap: () => setState(() => _selectedSeat = seat),
            child: Container(
              decoration: BoxDecoration(
                color: isSelected ? Colors.orange : Colors.grey[800],
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Text(
                  "${index + 1}",
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ),
          );
        },
      ),
    ),
  ),
),


            if (_selectedSeat != null)
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "✅ Wybrałeś: $_selectedFilm • $_selectedTime • $_selectedSeat",
                  style: const TextStyle(color: Colors.orange, fontSize: 14),
                ),
              ),

            ElevatedButton(
              onPressed: _selectedSeat == null || _selectedFilm == null || _selectedTime == null
                  ? null
                  : () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("🎟️ Rezerwacja: $_selectedFilm • $_selectedTime • $_selectedSeat")),
                      );
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: const Text("Zarezerwuj", style: TextStyle(fontSize: 16, color: Colors.white)),
            ),

            const SizedBox(height: 32),
            const FooterPage(),   // 🔹 footer przewija się razem z treścią
          ],
        ),
      ),
    );
  }
}
