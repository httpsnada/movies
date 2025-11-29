import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(
          'Search', style: TextStyle(color: AppColors.white, fontSize: 20))),
    );
  }
}
