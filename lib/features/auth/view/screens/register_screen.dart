import 'package:flutter/material.dart';
import 'package:movies/ui/common/custom_formField.dart';
import 'package:movies/ui/common/language_sliding_switch.dart';
import 'package:movies/ui/common/validators.dart';
import 'package:movies/ui/design/design.dart';

import '../../../../core/routes/app_routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Register"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(AppImages.avatar1, height: 94, width: 94),
                    Image.asset(AppImages.avatar8, height: 161, width: 158),
                    Image.asset(AppImages.avatar2, height: 94, width: 94),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  "Avatar",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                CustomFormfield(
                  label: "Name",
                  imageIcon: AppIcons.idIcon,
                  controller: nameController,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                ),
                CustomFormfield(
                  label: "Email",
                  icon: Icons.email,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "Please enter your email";
                    }
                    if (!isValidEmail(text)) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                ),
                CustomFormfield(
                  label: "Password",
                  icon: Icons.lock,
                  controller: passwordController,
                  isPassword: true,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "Please enter your password";
                    }
                    if (text.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),
                CustomFormfield(
                  label: "Confirm Password",
                  icon: Icons.lock,
                  controller: confirmPasswordController,
                  isPassword: true,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "Please re-enter your password";
                    }
                    if (text != passwordController.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),
                CustomFormfield(
                  label: "Phone Number",
                  icon: Icons.phone,
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "Please enter your phone number";
                    }
                    if (!isValidPhone(text)) {
                      return "Please enter a valid phone number";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: isLoading ? null : _createAccount,
                  child: isLoading
                      ? const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(width: 12),
                            Text("Creating Account..."),
                          ],
                        )
                      : const Text("Create Account"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already Have Account ?",
                      style: TextStyle(fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.Login.routeName,
                        );
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: AppColors.Primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Align(alignment: Alignment.center, child: LanguageSwitcher()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _createAccount() {
    if (!validateForm()) return;

    setState(() => isLoading = true);

    Future.delayed(const Duration(seconds: 2), () {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Account Created Successfully")),
      );
      setState(() => isLoading = false);
    });
  }

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
