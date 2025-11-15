enum AppRoutes {
  OnboardingScreen("OnboardingScreen"),
  Login("LoginScreen"),
  Register("RegisterScreen"),
  Home("HomeScreen"),
  UpdateProfile("UpdateProfile"),
  MovieDetails("MovieDetailsScreen");

  final String routeName;

  const AppRoutes(this.routeName);
}
