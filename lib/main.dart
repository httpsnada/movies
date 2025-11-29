import 'package:flutter/material.dart';

void main() {
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
