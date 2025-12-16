import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_assets.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password"),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 24,
              children: [
                Image.asset(
                  AppImages.forgot_password,
                  width: MediaQuery.of(context).size.width * .5,
                  fit: BoxFit.cover,
                ),

                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        AppIcons.email,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                  validator: (text) {
                    final emailRegex = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                    );
                    if (text?.trim().isEmpty == true) {
                      return "Please enter a valid email address";
                    }
                    if (!emailRegex.hasMatch(text!)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),

                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      verifyEmail();
                    }
                  },
                  child: Text("Verify Email"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void verifyEmail() {}
}
