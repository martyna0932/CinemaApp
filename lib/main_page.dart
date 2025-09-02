import 'package:cinema_app/purchasepage.dart';
import 'package:flutter/material.dart';
import 'widget/footer.dart';
import 'widget/appbar.dart';
import 'data/appdata.dart';
import 'dart:async';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppData.loadPassword();
  runApp(const CinemaCityClone());
}

class CinemaCityClone extends StatelessWidget {
  const CinemaCityClone({super.key});

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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final nowosci = [
    {'image': 'assets/images/1.png', 'title': 'Avatar 2'},
    {'image': 'assets/images/2.png', 'title': 'Batman'},
    {'image': 'assets/images/3.png', 'title': 'Joker 2'},
    {'image': 'assets/images/4.png', 'title': 'Joker 2'},
    {'image': 'assets/images/5.png', 'title': 'Joker 2'},
    {'image': 'assets/images/6.png', 'title': 'Joker 2'},
    {'image': 'assets/images/7.png', 'title': 'Joker 2'},
    {'image': 'assets/images/8.png', 'title': 'Joker 2'},
    {'image': 'assets/images/9.png', 'title': 'Joker 2'},
    {'image': 'assets/images/10.png', 'title': 'Joker 2'},
  ];

  final wkrotce = [
    {'image': 'assets/images/6.png', 'title': 'Gladiator II'},
    {'image': 'assets/images/12.png', 'title': 'Dune Part 2'},
    {'image': 'assets/images/13.png', 'title': 'Dune Part 2'},
    {'image': 'assets/images/4.png', 'title': 'Dune Part 2'},
    {'image': 'assets/images/11.png', 'title': 'Dune Part 2'},
    {'image': 'assets/images/2.png', 'title': 'Dune Part 2'},
    {'image': 'assets/images/1.png', 'title': 'Dune Part 2'},
    {'image': 'assets/images/8.png', 'title': 'Dune Part 2'},
    {'image': 'assets/images/10.png', 'title': 'Dune Part 2'},
    {'image': 'assets/images/9.png', 'title': 'Dune Part 2'},
  ];

  final wydarzenia = [
    {'image': 'assets/images/5.png', 'title': 'Maraton Marvela'},
    {'image': 'assets/images/2.png', 'title': 'Seans z reżyserem'},
    {'image': 'assets/images/13.png', 'title': 'Dune Part 2'},
    {'image': 'assets/images/12.png', 'title': 'Dune Part 2'},
    {'image': 'assets/images/11.png', 'title': 'Dune Part 2'},
    {'image': 'assets/images/9.png', 'title': 'Dune Part 2'},
    {'image': 'assets/images/3.png', 'title': 'Dune Part 2'},
    {'image': 'assets/images/8.png', 'title': 'Dune Part 2'},
    {'image': 'assets/images/6.png', 'title': 'Dune Part 2'},
    {'image': 'assets/images/1.png', 'title': 'Dune Part 2'},
    {'image': 'assets/images/10.png', 'title': 'Dune Part 2'},
    {'image': 'assets/images/4.png', 'title': 'Dune Part 2'},
  ];

  final List<String> bannerImages = [
  'assets/images/banner1.png',
  'assets/images/banner2.png',
  'assets/images/banner3.png',
  ];

  int _currentBanner = 0;
  late Timer _bannerTimer;

  @override
  void initState() {
    super.initState();
    _bannerTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        _currentBanner = (_currentBanner + 1) % bannerImages.length;
      });
    });
  }

  @override
  void dispose() {
    _bannerTimer.cancel();
    super.dispose();
  }

  Widget buildBanner() {
  return SizedBox(
    height: 400,
    width: double.infinity,
    child: Stack(
      children: [
        Positioned.fill(
          child: Image.network(
            bannerImages[_currentBanner],
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                const Center(child: Icon(Icons.error, color: Colors.red)),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.4),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Witaj w Cinema City',
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Purchasepage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 237, 119, 1),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 12),
                ),
                child: const Text('Rezerwuj bilety',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ],
          ),
        )
      ],
    ),
  );
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPage(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildBanner(),
            const SizedBox(height: 32),
            buildSection('Nowości w kinie', nowosci),
            const SizedBox(height: 32),
            buildSection('Wkrótce', wkrotce),
            const SizedBox(height: 32),
            buildSection('Wydarzenia specjalne', wydarzenia),
            const SizedBox(height: 48),
            const FooterPage(),
          ],
        ),
      ),
    );
  }

  Widget buildSection(String title, List<Map<String, String>> movies) {
    final controller = ScrollController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 237, 119, 1))),
          const SizedBox(height: 16),
          SizedBox(
            height: 300,
            child: Stack(
              children: [
                ListView(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  children: movies.map((movie) {
                    return moviePoster(movie['image']!, movie['title']!);
                  }).toList(),
                ),
                Positioned(
                  left: 0,
                  top: 100,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () {
                      controller.animateTo(controller.offset - 200,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                    },
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 100,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios,
                        color: Colors.white),
                    onPressed: () {
                      controller.animateTo(controller.offset + 200,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget moviePoster(String imagePath, String title) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [BoxShadow(color: Colors.black54, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.network(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Center(
                    child: Icon(Icons.error, color: Colors.red)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              title,
              style:
                  const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
