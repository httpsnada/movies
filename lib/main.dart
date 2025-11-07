import 'package:flutter/material.dart';

import 'core/routes/routes.dart';
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
      initialRoute: AppRoutes.OnboardingScreen.routeName,
      routes: {
        // AppRoutes.OnboardingScreen.routeName : (context) => OnboardingScreen(),
      },
    );
  }
}

