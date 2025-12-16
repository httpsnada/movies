import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/ui/common/language_sliding_switch.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../ui/common/custom_formField.dart';
import '../../../../ui/common/validators.dart';
import '../../../../ui/design/design.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.appIcon, width: 121, height: 118),
              SizedBox(height: 40),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomFormfield(
                      label: "Email",
                      icon: Icons.email,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (text) {
                        if (text?.trim().isEmpty == true) {
                          return "Please enter your email";
                        }
                        if (!isValidEmail(text)) {
                          return "Please enter a valid email";
                        }
                      },
                    ),

                    CustomFormfield(
                      label: "Password",
                      icon: Icons.lock,
                      controller: passwordController,
                      isPassword: true,
                      keyboardType: TextInputType.text,
                      validator: (text) {
                        if (text?.trim().isEmpty == true) {
                          return "Please enter your password";
                        }
                        if ((text?.length ?? 0) < 6) {
                          return "Password must be at least 6 characters";
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text("Forget Password ?"),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: isLoading ? null : () {},
                      child: isLoading
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(width: 12),
                                Text("Logging in"),
                              ],
                            )
                          : Text("Login"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: GoogleFonts.roboto().fontStyle,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, AppRoutes.Register.routeName);

                          },
                          child: Text(
                            "Create One",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppColors.Primary,
                            indent: 40,
                            thickness: 1.2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "OR",
                            style: TextStyle(
                              fontSize: 16,
                              fontStyle: GoogleFonts.roboto().fontStyle,
                              color: AppColors.Primary,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: AppColors.Primary,
                            endIndent: 40,
                            thickness: 1.2,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppIcons.googleIcon,
                        height: 24,
                        width: 24,
                      ),
                      label: Text('Login with Google'),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LanguageSwitcher(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /*
  void loging() async {
    if (validateForm() == false) {
      return;
    }
    setState(() {
      isLoading = true;
    });
    AppAuthProvider provider =
    Provider.of<AppAuthProvider>(context, listen: false);
    AuthResponse response = await provider.login(
        emailController.text,
        passwordController.text
    );
    if (response.success) {
      //successful registration
      //show dialog of success
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Logged in successful!")),
      );
    } else {
      //failed registration
      handleAuthError(response);
    }
    setState(() {
      isLoading = false;
    });
  }
*/

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  /*
  void handleAuthError(AuthResponse response) {
    String errormessage;

    switch (response.failure) {
      case AuthFailure.invalidCredentials:
        errormessage = "The email or password is incorrect.";
        break;
      default:
        errormessage = "something went wrong.";
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errormessage)),
    );
  }
*/
}
