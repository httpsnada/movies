enum AppRoutes {
  OnboardingScreen("OnboardingScreen"),
  Login("LoginScreen"),
  Register("RegisterScreen"),
  ForgetPassword("ForgetPasswordScreen"),
  Home("HomeScreen"),
  UpdateProfile("UpdateProfile"),
  AppShell("AppShell"),
  Browse("BrowseView"),
  Search("SearchView"),
  Profile("ProfileView"),
  MovieDetails("MovieDetailsScreen");

  final String routeName;

  const AppRoutes(this.routeName);
}