import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/api_service.dart';
import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final ApiService apiService;

  MoviesBloc(this.apiService) : super(MoviesInitial()) {
    // Fetch popular movies
    on<FetchMoviesEvent>((event, emit) async {
      emit(MoviesLoading());
      try {
        final response = await apiService.getRequest("list_movies.json");
        final movies = response["data"]["movies"] ?? [];
        emit(MoviesLoaded(movies));
      } catch (e) {
        emit(MoviesError(e.toString()));
      }
    });

    // Search movies
    on<SearchMoviesEvent>((event, emit) async {
      emit(MoviesLoading());
      try {
        final response = await apiService.getRequest("list_movies.json?query_term=${event.query}");
        final movies = response["data"]["movies"] ?? [];
        emit(MoviesLoaded(movies));
      } catch (e) {
        emit(MoviesError(e.toString()));
      }
    });
  }
}
