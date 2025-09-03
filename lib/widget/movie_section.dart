import 'package:flutter/material.dart';
import 'movie_poster.dart';

class MovieSection extends StatelessWidget {
  final String title;
  final List<Map<String, String>> movies;

  const MovieSection({super.key, required this.title, required this.movies});

  @override
  Widget build(BuildContext context) {
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
                  children: movies
                      .map((movie) => MoviePoster(
                            imagePath: movie['image']!,
                            title: movie['title']!,
                          ))
                      .toList(),
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
}
