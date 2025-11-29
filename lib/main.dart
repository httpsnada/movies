import 'package:flutter/material.dart';
import 'package:movies/core/routes/app_routes.dart';
import 'package:movies/features/browse/view/browse_view.dart';
import 'package:movies/features/home/view/home_view.dart';
import 'package:movies/features/movie_details/view/movie_details_page.dart';
import 'package:movies/features/profile/view/profile_view.dart';
import 'package:movies/features/search/view/search_view.dart';
import 'package:movies/features/shared/app_shell.dart';

import 'core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
