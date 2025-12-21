import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_assets.dart';
import 'package:movies/core/theme/app_theme.dart';
import 'package:movies/features/movies/data/Movies.dart';

import '../../../../../core/routes/app_routes.dart';

class HeroCarousel extends StatefulWidget {
  final List<MoviesModel> movies;

  const HeroCarousel({super.key, required this.movies});

  @override
  State<HeroCarousel> createState() => _HeroCarouselState();
}

class _HeroCarouselState extends State<HeroCarousel> {
  late PageController _pageController;
  int _focusedIndex = 0;

  List<MoviesModel> get loopedMovies =>
      [
    ...widget.movies,
    ...widget.movies,
    ...widget.movies,
  ];

  int get middleIndex => widget.movies.length;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.58,
      initialPage: middleIndex,
    );
    _focusedIndex = middleIndex;
  }

  // @override
  // void dispose() {
  //   _pageController.dispose();
  //   super.dispose();
  // }

  void _handleLoop(int index) {
    final total = loopedMovies.length;

    if (index == 0) {
      final jumpTo = total ~/ 3;
      _pageController.jumpToPage(jumpTo);
    } else if (index == total - 1) {
      final jumpTo = total ~/ 3 * 2;
      _pageController.jumpToPage(jumpTo);
    }
  }

  @override
  Widget build(BuildContext context) {
    final movie = loopedMovies[_focusedIndex];
    final double deviceHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        //BG image
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          child: Container(
            key: ValueKey(_focusedIndex),
            width: double.infinity,
            height: deviceHeight * .65,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    loopedMovies[_focusedIndex].mediumCoverImage ?? ""),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        //BG Gradient
        Container(
          width: double.infinity,
          height: deviceHeight * .65,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.primary.withValues(alpha: 0.5),
                AppColors.primary,
              ],
            ),
          ),
        ),

        //available
        Positioned(
          top: 16,
          left: 40,
          right: 40,
          child: Image.asset(
            AppImages.available,
            fit: BoxFit.cover,
            height: 95,
          ),
        ),

        // carousel
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.only(top: 120, bottom: 120),
            child: PageView.builder(
              controller: _pageController,
              itemCount: loopedMovies.length,
              onPageChanged: (index) {
                setState(() => _focusedIndex = index);
                _handleLoop(index);
              },
              itemBuilder: (context, index) {
                final movie = loopedMovies[index];

                final double isFocused = index == _focusedIndex ? 1.0 : 0.8;

                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.MovieDetails.routeName,
                      arguments: movie.id,
                    );
                  },
                  child: Transform.scale(
                    scale: isFocused,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                          movie.mediumCoverImage ?? "", fit: BoxFit.cover),
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        //watch now
        Positioned(
          bottom: 0,
          left: 20,
          right: 20,
          child: Image.asset(
            AppImages.watch_now,
            fit: BoxFit.cover,
            height: 120,
          ),
        ),
      ],
    );
  }
}
