import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/movies/view/bloc/movies_bloc.dart';
import 'package:movies/features/movies/view/bloc/movies_event.dart';
import 'package:movies/features/movies/view/bloc/movies_state.dart';
import 'package:movies/ui/common/search_field.dart';

import '../../../../../core/theme/app_assets.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../widgets/movie_card.dart';

class SearchView extends StatefulWidget {
  SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SearchField(
            controller: controller,
            onChanged: (value) {
              if (value.isEmpty) {
                context.read<MoviesBloc>().add(FetchMoviesEvent());
              } else {
                context.read<MoviesBloc>().add(SearchMoviesEvent(value));
              }
            },
          ),
          // searchedMovies == null || searchedMovies!.isEmpty
          //     ? Expanded(
          //         child: Center(
          //           child: Image.asset(
          //             AppImages.popcorn,
          //             height: 124,
          //             fit: BoxFit.cover,
          //           ),
          //         ),
          //       )
          //     :
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: BlocBuilder<MoviesBloc, MoviesState>(
                builder: (context, state) {
                  if (state is MoviesLoading) {
                    return const SizedBox(
                      height: 200,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.yellow,
                        ),
                      ),
                    );
                  }

                  if (state is MoviesLoaded) {
                    if (state.movies.isEmpty) {
                      return Center(
                        child: Image.asset(
                          AppImages.popcorn,
                          height: 124,
                          fit: BoxFit.cover,
                        ),
                      );
                    }
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.66,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) {
                        final movie = state.movies[index];
                        return MovieCard(
                          movie: movie,
                          width: double.infinity,
                          height: double.infinity,
                        );
                      },
                    );
                  }

                  if (state is MoviesError) {
                    return Center(child: Text(state.message));
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
