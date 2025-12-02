import 'package:flutter/material.dart';
import 'package:movies/features/browse/widgets/tab_bar_item.dart';

import '../../home/widgets/movie_card.dart';
import '../../movies/data/movie_data.dart';
import '../../movies/data/movie_mockup.dart';

class BrowseView extends StatefulWidget {
  const BrowseView({super.key});

  @override
  State<BrowseView> createState() => _BrowseViewState();
}

class _BrowseViewState extends State<BrowseView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late List<String> categories;
  final List<MovieData> movies = MovieMockup.movies;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    // print("CATEGORIES: $categories");
    // print("COUNT: ${categories.length}");
    tabController = TabController(length: categories.length, vsync: this);

    tabController.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          if (categories.isNotEmpty)
            TabBar(
              tabAlignment: TabAlignment.start,
              dividerColor: Colors.transparent,
              controller: tabController,
              isScrollable: true,
              padding: EdgeInsets.zero,
              labelPadding: const EdgeInsets.symmetric(horizontal: 6),
              tabs: List.generate(
                categories.length,
                (index) => Tab(
                  child: TabBarItem(
                    title: categories[index],
                    isSelected: tabController.index == index,
                  ),
                ),
              ),
            ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.66,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: filteredMovies.length,
                itemBuilder: (context, index) {
                  return MovieCard(movie: filteredMovies[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<MovieData> get filteredMovies {
    final selectedCategory = categories[tabController.index];

    return movies.where((movie) {
      return movie.genres.contains(selectedCategory);
    }).toList();
  }

  List<String> getCategories() {
    final Set<String> genres = {};

    for (var movie in movies) {
      genres.addAll(movie.genres);
    }
    return genres.toList();
  }
}
