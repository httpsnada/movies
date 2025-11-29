import 'package:flutter/material.dart';

import '../design/design.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: Center(
        child: Image.asset(
          AppImages.popcorn,
          width: 140,
          height: 140,
        ),
      ),
    );
  }
}
