import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../core/assets/app_assets.dart';
import '../../movie_details/view/movie_details_page.dart';
import 'movie_grid_page.dart';

class HomeView extends StatefulWidget {

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<String> posters = [
    AppAssets.left_movie,
    AppAssets.onBoarding6,
    AppAssets.right_movie,
    AppAssets.bottom_left,
    AppAssets.bottom_right,
    AppAssets.in_between,
  ];

  double _page = 1.0;

  int get focusedIndex => _page.round().clamp(0, posters.length - 1);

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;

    final String bgPoster = posters[focusedIndex];
    final double frac = (_page - focusedIndex).abs().clamp(0.0, 1.0);
    final double baseBlur = 12.0;
    final double maxExtraBlur = 10.0;
    final double blurSigma = baseBlur + (maxExtraBlur * frac);
    final double baseScale = 1.06;
    final double scaleDelta = 0.06;
    final double bgScale = baseScale - (scaleDelta * frac);
    final double baseOpacity = 0.20;
    final double extraOpacity = 0.15;
    final double overlayOpacity = baseOpacity + (extraOpacity * frac);

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.close, color: Colors.white),
        centerTitle: true,
        title: const Text('Movies', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        actions: const [Icon(Icons.more_horiz, color: Colors.white)],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: screenW * 1.35,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 280),
                      switchInCurve: Curves.easeOut,
                      switchOutCurve: Curves.easeIn,
                      child: Transform.scale(
                        key: ValueKey<String>(bgPoster),
                        scale: bgScale,
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
                          child: Opacity(
                            opacity: 1.0,
                            child: Image.asset(
                              bgPoster,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned.fill(child: Container(color: Colors.black.withOpacity(overlayOpacity))),

                  Positioned(
                    top: screenW * 0.06,
                    child: IgnorePointer(
                      child: Image.asset(AppAssets.availableNow, width: screenW * 0.48, fit: BoxFit.contain),
                    ),
                  ),

                  Positioned(
                    top: screenW * 0.26,
                    left: 0,
                    right: 0,
                    height: screenW * 0.95,
                    child: HeroCarousel(
                      posters: posters.sublist(0, 3),
                      onPageScroll: (double p) {
                        setState(() {
                          _page = p;
                        });
                      },
                    ),
                  ),

                  Positioned(
                    bottom: 20,
                    child: IgnorePointer(
                      child: Opacity(opacity: 0.12, child: Image.asset(AppAssets.in_between, width: screenW * 0.85, fit: BoxFit.contain)),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 16)),

          SliverToBoxAdapter(child: Center(child: Image.asset(AppAssets.watchNow, width: screenW * 0.75, fit: BoxFit.contain))),

          const SliverToBoxAdapter(child: SizedBox(height: 24)),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Expanded(child: Text('Action', style: TextStyle(color: Colors.white70, fontSize: 18, fontWeight: FontWeight.w600))),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => MoviesGridPage(title: 'Action', posters: posters)));
                    },
                    child: Text('See More →', style: TextStyle(color: Colors.amber.shade400, fontSize: 14)),
                  ),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 14)),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 165,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemCount: 6,
                itemBuilder: (context, i) {
                  final img = (i % 2 == 0) ? AppAssets.bottom_left : AppAssets.bottom_right;

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MovieDetailsPage(imagePath: img, title: 'Movie ${i + 1}'),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(img, width: 110, height: 165, fit: BoxFit.cover),
                    ),
                  );
                },
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }
}
class HeroCarousel extends StatefulWidget {
  final List<String> posters;
  final ValueChanged<double>? onPageScroll;

  const HeroCarousel({super.key, required this.posters, this.onPageScroll});

  @override
  State<HeroCarousel> createState() => _HeroCarouselState();
}

class _HeroCarouselState extends State<HeroCarousel> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.64, initialPage: 1);
    _controller.addListener(_handleScroll);
  }

  void _handleScroll() {
    final p = _controller.hasClients ? (_controller.page ?? _controller.initialPage.toDouble()) : 1.0;
    widget.onPageScroll?.call(p);
  }

  @override
  void dispose() {
    _controller.removeListener(_handleScroll);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;

    return PageView.builder(
      controller: _controller,
      physics: const PageScrollPhysics(),
      itemCount: widget.posters.length,
      itemBuilder: (context, index) {
        final poster = widget.posters[index];

        final double page = (_controller.hasClients ? (_controller.page ?? _controller.initialPage.toDouble()) : _controller.initialPage.toDouble());
        final double diff = (page - index);
        final double absDiff = diff.abs();

        final double scale = (1 - (absDiff * 0.18)).clamp(0.78, 1.0);
        final double opacity = (1 - (absDiff * 0.45)).clamp(0.28, 1.0);
        final double yOffset = absDiff * 26;

        final cardWidth = screenW * 0.64;

        return Center(
          child: Transform.translate(
            offset: Offset(0, yOffset),
            child: Transform.scale(
              scale: scale,
              child: Opacity(
                opacity: opacity,
                child: SizedBox(
                  width: cardWidth,
                  height: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(poster, fit: BoxFit.cover),
                        Container(decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [Colors.black54, Colors.transparent]))),
                        Positioned(
                          top: 12,
                          left: 12,
                          child: Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6), decoration: BoxDecoration(color: Colors.black.withOpacity(0.55), borderRadius: BorderRadius.circular(12)), child: const Row(children: [Text('7.7', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), SizedBox(width: 6), Icon(Icons.star, size: 14, color: Color(0xFFF4C20D))])),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
