import 'package:flutter/material.dart';
import 'package:movies/routes.dart';
import 'package:movies/ui/design/design.dart';
import 'package:movies/ui/screens/login/view/login_screen.dart' as login;
import 'package:movies/ui/screens/profile/profile_screen.dart';
import 'package:movies/ui/screens/register/view/register_screen.dart'
    as register;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.ProfileScreen.route,
      routes: {
        AppRoutes.RegisterScreen.route: (context) => register.RegisterScreen(),
        AppRoutes.LoginScreen.route: (context) => login.LoginScreen(),
        AppRoutes.ProfileScreen.route: (context) => ProfileScreen(),
      },
    );
  }
}
