import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_assets.dart';
import '../../../../../core/theme/app_theme.dart';



class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: Container(
        height: 78,
        decoration: BoxDecoration(
          color: AppColors.charcoal,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(index: 0,
                  icon: AppIcons.home,
                  selectedIcon: AppIcons.homeSelected),
              _navItem(index: 1,
                  icon: AppIcons.search,
                  selectedIcon: AppIcons.searchSelected),
              _navItem(index: 2,
                  icon: AppIcons.browse,
                  selectedIcon: AppIcons.browseSelected),
              _navItem(index: 3,
                  icon: AppIcons.profile,
                  selectedIcon: AppIcons.profileSelected),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem({
    required int index,
    required String icon,
    required String selectedIcon,
  }) {
    final bool isActive = currentIndex == index;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          SvgPicture.asset(
            isActive ? selectedIcon : icon,
            width: 30,
            height: 30,
            colorFilter: ColorFilter.mode(
              isActive ? AppColors.yellow : AppColors.white,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 6),
          AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            width: isActive ? 22 : 0,
            height: 3,
            decoration: BoxDecoration(
              color: AppColors.yellow,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}
