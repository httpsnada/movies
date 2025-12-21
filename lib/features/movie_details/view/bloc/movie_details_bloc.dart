import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/movie_details/data/movie_details_repo.dart';

import 'movie_details_event.dart';
import 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final MoviesDetailsRepo repo;

  MovieDetailsBloc(this.repo) : super(MovieDetailsInitial()) {
    on<GetMovieDetails>(_getDetails);
  }

  Future<void> _getDetails(
    GetMovieDetails event,
    Emitter<MovieDetailsState> emit,
  ) async {
    emit(MovieDetailsLoading());

    try {
      final movie = await repo.getMovieDetails(event.movieId);
      emit(MovieDetailsLoaded(movie));
    } catch (e) {
      emit(MovieDetailsError(e.toString()));
    }
  }
}
