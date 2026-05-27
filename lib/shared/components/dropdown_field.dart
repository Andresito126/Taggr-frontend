import 'package:flutter/material.dart';
import 'package:taggr/shared/theme/app_colors.dart';
import 'package:taggr/shared/theme/app_text_styles.dart';

class DropdownField extends StatelessWidget {
  final String textInput;
  final String hTPlaceHolder;
  final IconData? iconInput;
  final List<String> items;
  final String? value;
  final Function(String?) onChanged;

  const DropdownField({
    super.key,
    required this.textInput,
    required this.hTPlaceHolder,
    required this.items,
    required this.onChanged,
    this.value,
    this.iconInput,
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

        DropdownButtonFormField<String>(
          value: value,
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.textSecondary,
          ),
          dropdownColor: AppColors.background,
          style: AppTextStyles.body.copyWith(color: AppColors.textPrimary),
          decoration: InputDecoration(
            prefixIcon: iconInput != null
                ? Icon(iconInput, color: AppColors.textSecondary)
                : null,
            hintText: hTPlaceHolder,
            hintStyle: AppTextStyles.caption.copyWith(
              color: AppColors.textSecondary,
            ),
            filled: true,
            fillColor: AppColors.surface,
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

          items: items.map((String category) {
            return DropdownMenuItem<String>(
              value: category,
              child: Text(category),
            );
          }).toList(),

          onChanged: onChanged,
        ),
      ],
    );
  }
}
