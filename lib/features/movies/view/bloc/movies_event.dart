import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// Fetch popular movies
class FetchMoviesEvent extends MoviesEvent {}

// Search movies
class SearchMoviesEvent extends MoviesEvent {
  final String query;

  SearchMoviesEvent(this.query);

  @override
  List<Object?> get props => [query];
}

class BrowseByGenre extends MoviesEvent {
  final String genre;

  BrowseByGenre(this.genre);

  @override
  List<Object?> get props => [genre];
}
