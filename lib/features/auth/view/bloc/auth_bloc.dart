import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/api_service.dart';
import '../../../../core/utils/pref_helper.dart';
import 'auth_event.dart';
import 'auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ApiService apiService;

  AuthBloc(this.apiService) : super(AuthInitial()) {
    // LOGIN EVENT
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final response = await apiService.PostRequest(
          "auth/login",
          {
            "email": event.email,
            "password": event.password,
          },
        );

        // Save Token
        await PrefHelper.saveToken(response["data"]["token"]);

        emit(AuthSuccess(
          message: "Login successful",
          user: response["data"],
        ));
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    // REGISTER EVENT
    on<RegisterEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final response = await apiService.PostRequest(
          "auth/register",
          {
            "name": event.name,
            "email": event.email,
            "password": event.password,
          },
        );

        emit(AuthSuccess(
          message: "Account created successfully",
          user: response["data"],
        ));
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    // LOGOUT EVENT
    on<LogoutEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await PrefHelper.clearToken();
        emit(AuthLoggedOut());
      } catch (e) {
        emit(AuthError("Failed to logout"));
      }
    });
  }
}
