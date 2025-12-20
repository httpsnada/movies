import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/theme/app_theme.dart';
import 'package:movies/features/movies/data/Movies.dart';
import 'package:movies/features/movies/data/movies_repo.dart';
import 'package:movies/features/movies/view/bloc/movies_bloc.dart';
import 'package:movies/features/movies/view/bloc/movies_event.dart';
import 'package:movies/features/movies/view/bloc/movies_state.dart';

import '../../widgets/hero_carousel.dart';
import '../../widgets/movie_card.dart';
import 'movie_grid_page.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  MoviesRepo moviesRepo = MoviesRepo();

  List<MoviesModel>? moviesList;

  Future<void> getMovies() async {
    final res = await moviesRepo.getMovies();
    setState(() {
      moviesList = res;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      MoviesBloc(MoviesRepo())
        ..add(FetchMoviesEvent()),
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            BlocBuilder<MoviesBloc, MoviesState>
              (builder: (context, state) {
              if (state is MoviesLoading) {
                return const SizedBox(
                  height: 200,
                  child: Center(child: CircularProgressIndicator(
                    color: AppColors.yellow,)),
                );
              }

              if (state is MoviesLoaded) {
                return HeroCarousel(movies: state.movies);
              }

              if (state is MoviesError) {
                return Text(state.message);
              }

              return const SizedBox.shrink();
            },
            ),

            const SizedBox(height: 20),

            BlocBuilder<MoviesBloc, MoviesState>
              (builder: (context, state) {
              if (state is MoviesLoading) {
                return const SizedBox(
                  height: 200,
                  child: Center(child: CircularProgressIndicator(
                    color: AppColors.yellow,)),
                );
              }

              if (state is MoviesLoaded) {
                return _buildCategory(
                    context, title: "All", movies: state.movies);
              }

              if (state is MoviesError) {
                return Text(state.message);
              }

              return const SizedBox.shrink();
            },
            ),

            const SizedBox(height: 20),

            // _buildCategory(context, title: "Drama", movies: movies),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(
    BuildContext context, {
    required String title,
        required List<MoviesModel> movies,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          MoviesGridPage(title: title, movies: movies),
                    ),
                  );
                },
                child: const Text(
                  "See more → ",
                  style: TextStyle(color: AppColors.yellow),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 15),

        SizedBox(
          height: 220,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: MovieCard(movie: movies[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
