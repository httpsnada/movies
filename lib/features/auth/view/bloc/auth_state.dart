import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

// Initial
class AuthInitial extends AuthState {}

// Loading
class AuthLoading extends AuthState {}

// SUCCESS (Login or Register)
class AuthSuccess extends AuthState {
  final String message;
  final dynamic user;

  AuthSuccess({required this.message, this.user});

  @override
  List<Object?> get props => [message, user];
}

// ERROR
class AuthError extends AuthState {
  final String message;

  AuthError(this.message);

  @override
  List<Object?> get props => [message];
}

// LoggedOut
class AuthLoggedOut extends AuthState {}
