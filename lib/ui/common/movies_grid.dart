import 'package:flutter/material.dart';
import 'package:movies/features/movies/data/movie_mockup.dart';

class MoviesGrid extends StatelessWidget {
  const MoviesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.68,
      ),
      itemCount: MovieMockup.movies.length,
      itemBuilder: (context, index) {
        final movie = MovieMockup.movies[index];

        return Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(movie.image, fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 8),
            Text(movie.title, style: TextStyle(color: Colors.white)),
          ],
        );
      },
    );
  }
}
