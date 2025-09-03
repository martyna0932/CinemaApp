import 'package:flutter/material.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
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
}
