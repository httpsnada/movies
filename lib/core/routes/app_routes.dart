enum AppRoutes {
  OnboardingScreen("OnboardingScreen"),
  Login("LoginScreen"),
  Register("RegisterScreen"),
  AppShell("AppShell"),
  Home("HomeView"),
  Browse("BrowseView"),
  Search("SearchView"),
  Profile("ProfileView"),
  MovieDetails("MovieDetailsScreen");

  final String routeName;

  const AppRoutes(this.routeName);
}