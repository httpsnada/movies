import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/ui/design/design.dart';

typedef Validator = String? Function(String? text);

class CustomFormfield extends StatefulWidget {
  final String label;
  final String? imageIcon; // لو SVG
  final IconData? icon; // لو Material Icon
  final TextInputType keyboardType;
  final bool isPassword;
  final Validator? validator;
  final TextEditingController? controller;

  const CustomFormfield({
    required this.label,
    this.imageIcon,
    this.icon,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.validator,
    this.controller,
    super.key,
  });

  @override
  State<CustomFormfield> createState() => _CustomFormfieldState();
}

class _CustomFormfieldState extends State<CustomFormfield> {
  bool secureText = false;

  @override
  void initState() {
    super.initState();
    secureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        obscureText: secureText,
        style: GoogleFonts.roboto(
          fontSize: 16,
          color: Colors.white,
        ),
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          labelText: widget.label,
          prefixIcon: widget.imageIcon != null
              ? Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              widget.imageIcon!,
              width: 26,
              height: 26,
              colorFilter: const ColorFilter.mode(AppColors.White, BlendMode.srcIn),

            ),
          )
              : Icon(widget.icon, color: AppColors.White),
          suffixIcon: widget.isPassword
              ? InkWell(
            onTap: () {
              setState(() {
                secureText = !secureText;
              });
            },
            child: Icon(
              secureText ? Icons.visibility_off : Icons.visibility,
              color: AppColors.White,
            ),
          )
              : null,
        ),
      ),
    );
  }
}
