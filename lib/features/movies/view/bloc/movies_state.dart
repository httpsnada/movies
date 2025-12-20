import 'package:equatable/equatable.dart';

import '../../data/Movies.dart';

abstract class MoviesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MoviesInitial extends MoviesState {}

class MoviesLoading extends MoviesState {}

class MoviesLoaded extends MoviesState {
  final List<MoviesModel> movies;

  MoviesLoaded(this.movies);

  @override
  List<Object?> get props => [movies];
}

class MoviesError extends MoviesState {
  final String message;

  MoviesError(this.message);

  @override
  List<Object?> get props => [message];
}
