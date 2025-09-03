import 'package:flutter/material.dart';

class CouponsTab extends StatefulWidget {
  const CouponsTab({super.key});

  @override
  State<CouponsTab> createState() => _CouponsTabState();
}

class _CouponsTabState extends State<CouponsTab> {
  final Map<String, String?> _couponCodes = {};

  String _generateCouponCode() {
    return "CODE${DateTime.now().millisecondsSinceEpoch}";
  }

  @override
  Widget build(BuildContext context) {
    final coupons = [
      "🎟️ -20% na bilety w weekend",
      "🍿 Darmowy popcorn w poniedziałek",
    ];

    return Container(
      color: Colors.black,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: coupons.length,
        itemBuilder: (context, index) {
          final coupon = coupons[index];
          final code = _couponCodes[coupon];

          return Card(
            color: const Color.fromARGB(255, 233, 156, 40),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(coupon, style: const TextStyle(color: Colors.white, fontSize: 16)),
                  const SizedBox(height: 10),
                  if (code != null)
                    Text(
                      "Kod: $code",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: code == null
                        ? () {
                            setState(() {
                              _couponCodes[coupon] = _generateCouponCode();
                            });
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: code == null ? Colors.black87 : Colors.orange,
                    ),
                    child: const Text("Generuj kod"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
