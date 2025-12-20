import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/movies_repo.dart';
import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesRepo moviesRepo;

  MoviesBloc(this.moviesRepo) : super(MoviesInitial()) {
    // fetch popular movies
    on<FetchMoviesEvent>(_getMovies);
    on<SearchMoviesEvent>(_searchMovies);
    on<BrowseByGenre>(_browseByGenre);
  }

  Future<void> _getMovies(
    FetchMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    emit(MoviesLoading());

    try {
      final movies = await moviesRepo.getMovies();
      emit(MoviesLoaded(movies ?? []));
    } catch (e) {
      emit(MoviesError(e.toString()));
    }
  }

  // search movies
  Future<void> _searchMovies(
    SearchMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    emit(MoviesLoading());

    try {
      final movies = await moviesRepo.getMovies(query: event.query);
      emit(MoviesLoaded(movies ?? []));
    } catch (e) {
      emit(MoviesError(e.toString()));
    }
  }

  // browse by genre
  Future<void> _browseByGenre(
    BrowseByGenre event,
    Emitter<MoviesState> emit,
  ) async {
    emit(MoviesLoading());

    try {
      final movies = await moviesRepo.getMovies(
        genre: event.genre.toLowerCase(),
      );
      emit(MoviesLoaded(movies ?? []));
    } catch (e) {
      emit(MoviesError(e.toString()));
    }
  }
}
