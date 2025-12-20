import 'package:flutter/material.dart';
import 'package:movies/features/movies/data/Movies.dart';

import '../../widgets/movie_card.dart';



class MoviesGridPage extends StatelessWidget {
  final String title;
  final List<MoviesModel> movies;

  const MoviesGridPage({super.key, required this.title, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.66,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return MovieCard(
              movie: movie,
              width: double.infinity,
              height: double.infinity,
            );
          },
        ),
      ),
    );
  }
}
