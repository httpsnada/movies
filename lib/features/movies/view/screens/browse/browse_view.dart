import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_theme.dart';


class BrowseView extends StatelessWidget {
  const BrowseView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(
          'Browse', style: TextStyle(color: AppColors.white, fontSize: 20))),
    );
  }
}
