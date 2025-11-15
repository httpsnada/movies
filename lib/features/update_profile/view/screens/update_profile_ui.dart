import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/theme/app_assets.dart';
import 'package:movies/core/theme/app_theme.dart';

import 'avatar_picker_dialog.dart';

class UpdateProfile extends StatefulWidget {
  UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  String selectedAvatar = AppImages.avatar1;

  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pick Avatar"),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 36,
            children: [
              GestureDetector(
                onTap: _openAvatarPicker,
                child: Image.asset(
                  selectedAvatar,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 20,
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: "Nada Samy",
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(12),
                          child: Icon(Icons.person, size: 24),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name can not be empty';
                        }
                        return null;
                      },
                    ),

                    TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        hintText: "01200000000",
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(12),
                          child: SvgPicture.asset(
                            AppIcons.phone,
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Phone can not be empty';
                        }
                        return null;
                      },
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Reset Password",
                          style: Theme.of(context).textTheme.titleMedium,
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

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 20,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.white,
                backgroundColor: AppColors.red,
              ),
              child: Text("Delete Account"),
            ),

            ElevatedButton(onPressed: () {}, child: Text("Update Data")),
          ],
        ),
      ),
    );
  }

  void _openAvatarPicker() async {
    final result = await showDialog(
      context: context,
      builder: (context) => AvatarPickerDialog(currentAvatar: selectedAvatar),
    );

    if (result != null) {
      setState(() {
        selectedAvatar = result;
      });
    }
  }
}
