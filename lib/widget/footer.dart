import 'package:flutter/material.dart';

class FooterPage extends StatelessWidget {
  const FooterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildFooter();
  }

  Widget _buildFooter() {
    return Container(
      color: Colors.black,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Wrap(
            spacing: 32,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _footerColumn('O nas', ['Kim jesteśmy', 'Kariera', 'Kontakt']),
              _footerColumn('Pomoc', ['FAQ', 'Regulamin', 'Polityka prywatności']),
              _footerColumn('Usługi', ['Zakup biletów', 'Karta lojalnościowa', 'Prezent VIP']),
              _footerColumn('Media społecznościowe', ['Facebook', 'Instagram', 'YouTube']),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.language, color: Colors.white),
              const SizedBox(width: 8),
              TextButton(
                onPressed: () {},
                child: const Text('Polska | PL', style: TextStyle(color: Colors.white)),
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
    );
  }

  Widget _footerColumn(String title, List<String> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        for (var link in links)
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
            ),
            child: Text(link, style: const TextStyle(color: Colors.grey, fontSize: 14)),
          ),
      ],
    );
  }
}
