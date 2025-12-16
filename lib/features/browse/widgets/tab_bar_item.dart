import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_theme.dart';

class TabBarItem extends StatelessWidget {
  final String title;
  final bool isSelected;

  TabBarItem({super.key, required this.title, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.yellow : AppColors.primary,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.yellow),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? AppColors.primary : Colors.yellow,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
