import 'package:flutter/material.dart';

class MovieDetailsPage extends StatelessWidget {
  final String imagePath; // poster asset path
  final String title; // movie title

  const MovieDetailsPage({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(title, style: const TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Poster placeholder (can be replaced with Hero later)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: 350,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 16),

            // Title placeholder
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // Meta placeholders (rating, duration, genre)
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(color: Colors.black.withOpacity(0.6), borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: const [
                      Icon(Icons.star, size: 14, color: Color(0xFFF4C20D)),
                      SizedBox(width: 6),
                      Text('7.7', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(color: Colors.black.withOpacity(0.35), borderRadius: BorderRadius.circular(8)),
                  child: const Text('2h 19m', style: TextStyle(color: Colors.white70)),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(color: Colors.black.withOpacity(0.35), borderRadius: BorderRadius.circular(8)),
                  child: const Text('Action', style: TextStyle(color: Colors.white70)),
                ),
              ],
            ),

            const SizedBox(height: 18),

            // Description placeholder
            const Text(
              'Description',
              style: TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 8),

            const Text(
              'This is a placeholder description for the movie. The design/dev team can replace this '
                  'with the real synopsis, cast info, trailers and anything else later. For now it serves as '
                  'a base structure so the rest of the UI flows correctly.',
              style: TextStyle(color: Colors.white70, height: 1.4),
            ),

            const SizedBox(height: 24),

            // Example action buttons (placeholders)
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF4C20D),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('Play'),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  decoration: BoxDecoration(color: Colors.black.withOpacity(0.35), borderRadius: BorderRadius.circular(10)),
                  child: IconButton(onPressed: () {}, icon: const Icon(Icons.add, color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
