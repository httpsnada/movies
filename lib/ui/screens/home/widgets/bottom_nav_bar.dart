import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/assets/app_assets.dart';
import '../../../../core/theme/app_theme.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      child: Container(
        height: 78,
        decoration: BoxDecoration(
          color: AppColor.grey,   // ← ← هنا اللون الرمادي
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
              _navItem(index: 0, icon: AppAssets.home, selectedIcon: AppAssets.homeSelected),
              _navItem(index: 1, icon: AppAssets.search, selectedIcon: AppAssets.searchSelected),
              _navItem(index: 2, icon: AppAssets.browse, selectedIcon: AppAssets.browseSelected),
              _navItem(index: 3, icon: AppAssets.profile, selectedIcon: AppAssets.profileSelected),
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
              isActive ? AppColor.yellow : Colors.white70,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 6),
          AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            width: isActive ? 22 : 0,
            height: 3,
            decoration: BoxDecoration(
              color: AppColor.yellow,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}
