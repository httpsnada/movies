import 'package:flutter/material.dart';
import 'package:movies/features/movies/data/movie_mockup.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../ui/common/empty_list.dart';
import '../../../../../ui/common/movies_grid.dart';
import '../../../../../ui/design/design.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: AppColors.darkGrey,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.avatar8, width: 118, height: 118),
                      const SizedBox(width: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "12",
                                style: AppThemes.lightTheme.textTheme.titleLarge
                                    ?.copyWith(fontSize: 32),
                              ),
                              Text(
                                "Wish List",
                                style:
                                    AppThemes.lightTheme.textTheme.titleLarge,
                              ),
                            ],
                          ),
                          SizedBox(width: 12),
                          Column(
                            children: [
                              Text(
                                "10",
                                style: AppThemes.lightTheme.textTheme.titleLarge
                                    ?.copyWith(fontSize: 32),
                              ),
                              Text(
                                "History",
                                style:
                                    AppThemes.lightTheme.textTheme.titleLarge,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Text(
                    "John Safwat",
                    style: AppThemes.lightTheme.textTheme.titleLarge?.copyWith(
                      fontSize: 20,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.UpdateProfile.routeName,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(56),
                          ),
                          child: Text("Edit Profile"),
                        ),
                      ),
                      const SizedBox(width: 8),

                      SizedBox(
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.Login.routeName,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.Red,
                            minimumSize: const Size(130, 56),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Exit",
                                style: AppThemes.lightTheme.textTheme.bodyLarge!
                                    .copyWith(color: Colors.white),
                              ),
                              const SizedBox(width: 8),
                              const Icon(
                                Icons.logout,
                                size: 20,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),
                ],
              ),
            ),

            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    Container(
                      color: AppColors.darkGrey,
                      child: TabBar(
                        indicatorColor: AppColors.Primary,
                        indicatorWeight: 3,
                        labelColor: AppColors.Primary,
                        labelStyle: const TextStyle(fontSize: 20),
                        unselectedLabelColor: Colors.white,
                        tabs: const [
                          Tab(
                            text: "Watch List",
                            icon: Icon(Icons.list_rounded, size: 32),
                          ),
                          Tab(
                            text: "History",
                            icon: Icon(Icons.folder, size: 32),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: TabBarView(
                        children: [
                          MovieMockup.movies.isEmpty
                              ? EmptyList()
                              : MoviesGrid(),

                          Container(
                            color: AppColors.backgroundColor,
                            child: Center(
                              child: Image.asset(
                                AppImages.popcorn,
                                width: 140,
                                height: 140,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
