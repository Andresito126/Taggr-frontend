import 'package:flutter/material.dart';
import 'package:taggr/shared/theme/app_colors.dart';
import 'package:taggr/shared/theme/app_text_styles.dart';

class InputField extends StatelessWidget {
  final String textInput;
  final String hTPlaceHolder;
  final bool isPassword;
  final IconData? iconInput;
  final TextEditingController? controller;

  const InputField({
    super.key,
    required this.textInput,
    required this.hTPlaceHolder,
    this.isPassword = false,
    this.iconInput,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textInput,
          style: AppTextStyles.body.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),

        TextFormField(
          controller: controller,
          obscureText: isPassword,
          style: AppTextStyles.body.copyWith(color: AppColors.textPrimary),
          decoration: InputDecoration(
            prefixIcon: iconInput != null
                ? Icon(iconInput, color: AppColors.neonBlue)
                : null,

            hintText: hTPlaceHolder,
            hintStyle: AppTextStyles.caption.copyWith(
              color: AppColors.neonBlue,
            ),
            filled: true,
            fillColor: Colors.black,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 16.0,
            ),

            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: Colors.white12, width: 1),
            ),

            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: AppColors.neonGreen, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
