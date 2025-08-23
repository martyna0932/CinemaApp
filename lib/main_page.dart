import 'package:cinema_app/purchasepage.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'widget/footer.dart';
import 'widget/appbar.dart';


void main() {
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
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId('https://www.youtube.com/watch?v=QkkoHAzjnUs')!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
        loop: true,
        hideControls: true,
        disableDragSeek: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildBanner() {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: false,
              progressIndicatorColor: Colors.transparent,
              topActions: const [],
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
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Purchasepage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 237, 119, 1),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text('Rezerwuj bilety', style: TextStyle(fontSize: 18, color: Colors.white)),
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
            buildSection('Nowości w kinie'),
            const SizedBox(height: 32),
            buildSection('Wkrótce'),
            const SizedBox(height: 32),
            buildSection('Wydarzenia specjalne'),
            const SizedBox(height: 48),
            const FooterPage(),
          ],
        ),
      ),
    );
  }

  Widget buildSection(String title) {
    final controller = ScrollController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 237, 119, 1))),
          const SizedBox(height: 16),
          SizedBox(
            height: 300,
            child: Stack(
              children: [
                ListView(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(12, (index) {
                    return moviePoster(
                      'https://m.media-amazon.com/images/I/71p4wJvEo6L._AC_SY679_.jpg',
                      'Film ${index + 1}',
                    );
                  }),
                ),
                Positioned(
                  left: 0,
                  top: 100,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () {
                      controller.animateTo(controller.offset - 200, duration: const Duration(milliseconds: 300), curve: Curves.ease);
                    },
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 100,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                    onPressed: () {
                      controller.animateTo(controller.offset + 200, duration: const Duration(milliseconds: 300), curve: Curves.ease);
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

  Widget moviePoster(String imageUrl, String title) {
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
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.network(imageUrl, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  
  
}
