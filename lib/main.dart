import 'package:flutter/material.dart';

import 'core/routes/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'features/browse/view/browse_view.dart';
import 'features/home/view/home_view.dart';
import 'features/movie_details/view/movie_details_page.dart';
import 'features/movies/data/movie_mockup.dart';
import 'features/profile/view/profile_view.dart';
import 'features/search/view/search_view.dart';
import 'features/shared/app_shell.dart';

void main() {
  final mock = MovieMockup();
  mock.loadSimilar();

  runApp(const MyApp());
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
      initialRoute: AppRoutes.Home.routeName,
      routes: {
        // AppRoutes.OnboardingScreen.routeName : (context) => OnboardingScreen(),
        AppRoutes.AppShell.routeName: (context) => AppShell(),
        AppRoutes.Home.routeName: (context) => HomeView(),
        AppRoutes.Search.routeName: (context) => SearchView(),
        AppRoutes.Browse.routeName: (context) => BrowseView(),
        AppRoutes.Profile.routeName: (context) => ProfileView(),
        AppRoutes.MovieDetails.routeName: (context) => MovieDetails(),
      },
    );
  }
}
