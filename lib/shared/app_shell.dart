import 'package:flutter/material.dart';

import '../features/movies/view/screens/browse/browse_view.dart';
import '../features/movies/view/screens/home/home_view.dart';
import '../features/movies/view/screens/profile/profile_view.dart';
import '../features/movies/view/screens/search/search_view.dart';
import '../features/movies/view/widgets/bottom_nav_bar.dart';



class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _index = 0;

  final List<Widget> _pages = [
    HomeView(),
    SearchView(),
    const BrowseView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // keep body visible behind the rounded bottom nav and avoid black band
      extendBody: true,
      backgroundColor: Colors.transparent,

      // IndexedStack preserves states of pages (good UX)
      body: IndexedStack(index: _index, children: _pages),

      // Bottom nav visible on all main screens
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Container(
            height: 78,
            decoration: BoxDecoration(
              // use a semi-opaque container so the rounded nav looks like a floating bar
              color: const Color(0xFF282A28), // AppColor.grey if you prefer
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
              child: BottomNavBar(
                currentIndex: _index,
                onTap: (i) => setState(() => _index = i),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
