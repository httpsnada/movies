import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class StatsButtonsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = [
      {"icon": Icons.favorite, "value": "15"},
      {"icon": Icons.timer, "value": "90"},
      {"icon": Icons.star_rounded, "value": "7.6"},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: items.map((item) {
        return _StatButton(
          icon: item["icon"] as IconData,
          label: item["value"] as String,
        );
      }).toList(),
    );
  }
}

class _StatButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _StatButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(icon, size: 24, color: AppColors.yellow),
      onPressed: () {},
      label: Text(label,style: TextStyle(color: AppColors.white,fontSize: 24,fontWeight: FontWeight.bold),),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkGrey,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
