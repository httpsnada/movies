import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/shared/app_shell.dart';

import 'core/network/api_service.dart';
import 'core/routes/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/view/bloc/auth_bloc.dart';
import 'features/movies/view/screens/browse/browse_view.dart';
import 'features/movies/view/screens/home/home_view.dart';
import 'features/movies/view/screens/movie_details/movie_details_page.dart';
import 'features/movies/view/screens/profile/profile_view.dart';
import 'features/movies/view/screens/search/search_view.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => AuthBloc(ApiService()))],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: AppRoutes.AppShell.routeName,
      routes: {
        // AppRoutes.OnboardingScreen.routeName : (context) => OnboardingScreen(),
        AppRoutes.AppShell.routeName: (context) => AppShell(),
        AppRoutes.Home.routeName: (context) => HomeView(),
        AppRoutes.Search.routeName: (context) => SearchView(),
        AppRoutes.Browse.routeName: (context) => BrowseView(),
        AppRoutes.Profile.routeName: (context) => ProfileView(),
        AppRoutes.MovieDetails.routeName: (context) => MovieDetailsPage(),
      },
    );
  }
}
