import 'package:flutter/material.dart';
import 'widget/footer.dart';
import 'widget/appbar.dart';
import 'widget/movie_section.dart';
import 'widget/banner.dart';
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
    'assets/images/banner5.png',
    'assets/images/banner4.png',
  ];

  int _currentBanner = 0;
  late Timer _bannerTimer;

  @override
  void initState() {
    super.initState();
    _bannerTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPage(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BannerWidget(bannerImages: bannerImages, currentBanner: _currentBanner),
            const SizedBox(height: 32),
            MovieSection(title: 'Nowości w kinie', movies: nowosci),
            const SizedBox(height: 32),
            MovieSection(title: 'Wkrótce', movies: wkrotce),
            const SizedBox(height: 32),
            MovieSection(title: 'Wydarzenia specjalne', movies: wydarzenia),
            const SizedBox(height: 48),
            const FooterPage(),
          ],
        ),
      ),
    );
  }
}
