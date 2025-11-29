enum AppRoutes {
  OnboardingScreen("OnboardingScreen"),
  Login("LoginScreen"),
  Register("RegisterScreen"),
  Home("HomeScreen"),
  MovieDetails("MovieDetailsScreen");

  final String routeName;

  const AppRoutes(this.routeName);
}
