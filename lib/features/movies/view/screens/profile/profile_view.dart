import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_theme.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(
          'Profile', style: TextStyle(color: AppColors.white, fontSize: 20))),
    );
  }
}
