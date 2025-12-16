import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_assets.dart';
import 'package:movies/features/home/widgets/movie_card.dart';
import 'package:movies/features/movies/data/movie_data.dart';
import 'package:movies/features/movies/data/movie_mockup.dart';
import 'package:movies/features/search/widgets/search_field.dart';

import '../../../../../../core/theme/app_theme.dart';
class SearchView extends StatefulWidget {
  SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController controller = TextEditingController();
  final List<MovieData> movies = MovieMockup.movies;
  List<MovieData>? searchedMovies = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SearchField(
            controller: controller,
            onChanged: (value) {
              searchForMovie(value);
            },
          ),
          searchedMovies == null || searchedMovies!.isEmpty
              ? Expanded(
                  child: Center(
                    child: Image.asset(
                      AppImages.popcorn,
                      height: 124,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.66,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                      itemCount: searchedMovies?.length,
                      itemBuilder: (context, index) {
                        final movie = searchedMovies![index];
                        return MovieCard(
                          movie: movie,
                          width: double.infinity,
                          height: double.infinity,
                        );
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  void searchForMovie(String text) {
    List<MovieData> filteredList = [];
    for (int i = 0; i < movies.length; i++) {
      if (movies[i].title.toLowerCase().contains(text.toLowerCase())) {
        filteredList.add(movies[i]);
      }
    }
    setState(() {
      searchedMovies = filteredList;
    });
  }
}
