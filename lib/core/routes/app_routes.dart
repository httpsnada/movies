import 'package:flutter/material.dart';

import '../../ui/screens/home/view/home_view.dart';
import '../../ui/screens/browse/view/browse_view.dart';
import '../../ui/screens/search/view/search_view.dart';
import '../../ui/screens/profile/view/profile_view.dart';
import '../../ui/screens/home/view/category_page.dart';
import '../../ui/screens/movie_details/view/movie_details_page.dart';

class AppRoutes {
  AppRoutes._();

  static const String home = '/home';
  static const String browse = '/browse';
  static const String search = '/search';
  static const String profile = '/profile';
  static const String category = '/category';
  static const String movieDetails = '/movieDetails';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomeView(),
    browse: (context) => const BrowseView(),
    search: (context) => const SearchView(),
    profile: (context) => const ProfileView(),

    // CATEGORY
    category: (context) {
      final genre = ModalRoute.of(context)?.settings.arguments as String? ?? "Category";
      return CategoryPage(genre: genre);
    },

    // MOVIE DETAILS — matches your EXACT constructor
    movieDetails: (context) {
      final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

      final String imagePath = args?['imagePath'] ?? '';
      final String title     = args?['title'] ?? 'Movie';

      return MovieDetailsPage(
        imagePath: imagePath,
        title: title,
      );
    },
  };
}
