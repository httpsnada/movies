import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_theme.dart';
import '../../../data/movie_data.dart';


class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    MovieData movie = ModalRoute.of(context)?.settings.arguments as MovieData;
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: Center(
        child: Text(
          'Movie Details',
          style: TextStyle(color: AppColors.white, fontSize: 20),
        ),
      ),
    );
  }
}
