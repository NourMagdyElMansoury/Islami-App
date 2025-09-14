import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/app_colors.dart';

class SuraSeatchTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onSubmitted;
  final Widget? suffixIcon;

  const SuraSeatchTextField({
    super.key,
    required this.controller,
    this.onSubmitted,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: AppColor.white,
      style: const TextStyle(
        color: AppColor.white,
        fontFamily: 'janadk',
      ),
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: AppColor.secondaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: AppColor.secondaryColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: AppColor.secondaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: AppColor.secondaryColor),
        ),
        filled: true,
        fillColor: AppColor.primaryColor.withValues(alpha: .5),
        hintText: 'Sura Name',
        hintStyle: const TextStyle(
          color: AppColor.white,
          fontFamily: 'jana',
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(
            'assets/icons/quran.svg',
            colorFilter: const ColorFilter.mode(
              AppColor.secondaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        suffixIcon: suffixIcon, // ✅ added to support search button
      ),
    );
  }
}
