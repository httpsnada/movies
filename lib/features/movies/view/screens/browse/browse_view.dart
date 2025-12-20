import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/movies/view/bloc/movies_state.dart';
import 'package:movies/ui/common/tab_bar_item.dart';

import '../../../../../core/theme/app_theme.dart';
import '../../bloc/movies_bloc.dart';
import '../../bloc/movies_event.dart';
import '../../widgets/movie_card.dart';

class BrowseView extends StatefulWidget {
  const BrowseView({super.key});

  @override
  State<BrowseView> createState() => _BrowseViewState();
}

class _BrowseViewState extends State<BrowseView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final List<String> genres = [
    'Action',
    'Adventure',
    'Animation',
    'Biography',
    'Comedy',
    'Crime',
    'Drama',
    'Horror',
    'Thriller',
    'Romance',
    'Sci-Fi',
    'Music',
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: genres.length, vsync: this);
    tabController.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          TabBar(
            tabAlignment: TabAlignment.start,
            dividerColor: Colors.transparent,
            controller: tabController,
            isScrollable: true,
            padding: EdgeInsets.zero,
            labelPadding: const EdgeInsets.symmetric(horizontal: 6),
            tabs: List.generate(
              genres.length,
              (index) => Tab(
                child: TabBarItem(
                  title: genres[index],
                  isSelected: tabController.index == index,
                ),
              ),
            ),
            onTap: (index) {
              context.read<MoviesBloc>().add(BrowseByGenre(genres[index]));
            },
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: BlocBuilder<MoviesBloc, MoviesState>(
                builder: (context, state) {
                  if (state is MoviesLoading) {
                    return const SizedBox(
                      height: 200,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.yellow,
                        ),
                      ),
                    );
                  }

                  if (state is MoviesLoaded) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.66,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) {
                        return MovieCard(movie: state.movies[index]);
                      },
                    );
                  }

                  if (state is MoviesError) {
                    return Center(child: Text(state.message));
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // List<String> getCategories() {
  //   final Set<String> genres = {};
  //
  //   for (var movie in movies) {
  //     genres.addAll(movie.genres);
  //   }
  //   return genres.toList();
  // }
}
