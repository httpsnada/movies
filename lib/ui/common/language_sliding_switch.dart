import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

import '../design/design.dart';

class LanguageSwitcher extends StatefulWidget {
  @override
  State<LanguageSwitcher> createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher> {
  // Temporary selected locale (no provider yet)
  Locale _selectedLocale = const Locale('en');

  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<Locale>.rolling(
      // Current selected language
      current: _selectedLocale,

      // Available language options
      values: const [Locale('en'), Locale('ar')],

      // What happens when user toggles
      onChanged: (value) {
        setState(() {
          _selectedLocale = value;
        });
      },

      // Icons for each language
      iconBuilder: (value, foreground) {
        if (value == const Locale('en')) {
          return Image.asset(AppImages.IconEn, width: 24, height: 24);
        } else {
          return Image.asset(AppImages.IconAr, width: 24, height: 24);
        }
      },

      // Style
      style: ToggleStyle(
        indicatorColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Colors.transparent,
        borderColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
