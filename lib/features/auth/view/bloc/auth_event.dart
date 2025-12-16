import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// LOGIN
class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

// REGISTER
class RegisterEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  RegisterEvent({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [name, email, password];
}

// LOGOUT
class LogoutEvent extends AuthEvent {}
