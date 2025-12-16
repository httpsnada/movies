import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_assets.dart';
import 'package:movies/core/theme/app_theme.dart';
import 'package:movies/features/update_profile/view/widgets/avatar_item.dart';

class AvatarPickerDialog extends StatefulWidget {
  final String currentAvatar;

  const AvatarPickerDialog({super.key, required this.currentAvatar});

  @override
  State<AvatarPickerDialog> createState() => _AvatarPickerDialogState();
}

class _AvatarPickerDialogState extends State<AvatarPickerDialog> {
  int? selectedIndex;
  final List<String> avatars = [
    AppImages.avatar1,
    AppImages.avatar2,
    AppImages.avatar3,
    AppImages.avatar4,
    AppImages.avatar5,
    AppImages.avatar6,
    AppImages.avatar7,
    AppImages.avatar8,
    AppImages.avatar9,
  ];

  @override
  void initState() {
    super.initState();

    selectedIndex = avatars.indexOf(widget.currentAvatar);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.charcoal,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: avatars.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            return AvatarItem(
              image: avatars[index],
              isSelected: selectedIndex == index,
              onTap: () {
                setState(() => selectedIndex = index);
                Navigator.pop(context, avatars[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
