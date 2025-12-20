import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/auth/view/screens/forgot_password_screen.dart';
import 'package:movies/features/auth/view/screens/login_screen.dart';
import 'package:movies/features/auth/view/screens/register_screen.dart';
import 'package:movies/features/update_profile/view/screens/update_profile_ui.dart';
import 'package:movies/shared/app_shell.dart';
import 'package:movies/ui/design/design.dart';

import 'core/network/api_service.dart';
import 'core/network/dio_client/dio_auth_client.dart';
import 'core/routes/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/view/bloc/auth_bloc.dart';
import 'features/movies/data/movies_repo.dart';
import 'features/movies/view/bloc/movies_bloc.dart';
import 'features/movies/view/bloc/movies_event.dart';
import 'features/movies/view/screens/browse/browse_view.dart';
import 'features/movies/view/screens/home/home_view.dart';
import 'features/movies/view/screens/movie_details/movie_details_page.dart';
import 'features/movies/view/screens/profile/profile_view.dart';
import 'features/movies/view/screens/search/search_view.dart';


void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc(ApiService(DioAuthClient().dio))),
        BlocProvider(
          create: (_) => MoviesBloc(MoviesRepo())..add(FetchMoviesEvent()),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.lightTheme,
      title: 'Movies',
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: AppRoutes.AppShell.routeName,
      routes: {
        AppRoutes.AppShell.routeName: (context) => AppShell(),
        AppRoutes.Home.routeName: (context) => HomeView(),
        AppRoutes.Search.routeName: (context) => SearchView(),
        AppRoutes.Browse.routeName: (context) => BrowseView(),
        AppRoutes.Profile.routeName: (context) => ProfileView(),
        AppRoutes.Login.routeName: (context) => LoginScreen(),
        AppRoutes.Register.routeName: (context) => RegisterScreen(),
        AppRoutes.MovieDetails.routeName: (context) => MovieDetailsPage(),
        AppRoutes.ForgetPassword.routeName: (context) => ForgotPasswordScreen(),
        AppRoutes.UpdateProfile.routeName: (context) => UpdateProfile(),
      },
    );
  }
}
