import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_theme.dart';

class AvatarItem extends StatelessWidget {
  final String image;
  final bool isSelected;
  final VoidCallback onTap;

  AvatarItem({
    super.key,
    required this.image,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.yellow.withValues(alpha: 0.5)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.yellow, width: 2),
        ),
        child: Image.asset(image, width: 86, fit: BoxFit.cover),
      ),
    );
  }
}
