import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_assets.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../movies/data/movie_data.dart';



class HeaderSection extends StatelessWidget {
  final MovieData movie;

  const HeaderSection({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SizedBox(
        height: deviceHeight * .65,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.asset(
                movie.image,
                width: double.infinity,
                height: deviceHeight * .65,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.primary.withValues(alpha: 0.4),
                    AppColors.primary,
                  ],
                ),
              ),
            ),

            // Back + Save
            Positioned(
              top: 40,
              left: 8,
              right: 8,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new,
                        size: 32, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  SvgPicture.asset(AppIcons.saved),
                ],
              ),
            ),

            // Play Button
            Center(
              child: SvgPicture.asset(AppIcons.playButton, width: 90),
            ),

            // Movie Title
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  movie.title,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
