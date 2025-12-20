import 'package:flutter/material.dart';
import 'package:movies/features/movies/data/Movies.dart';

import '../../../../../../core/theme/app_theme.dart';


class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    MoviesModel movie =
        ModalRoute.of(context)?.settings.arguments as MoviesModel;
    return Scaffold(
      appBar: AppBar(title: Text(movie.title ?? "")),
      body: Center(
        child: Text(
          'Movie Details',
          style: TextStyle(color: AppColors.white, fontSize: 20),
        ),
      ),
    );
  }
}
