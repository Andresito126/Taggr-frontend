import 'package:flutter/material.dart';
import 'package:taggr/shared/theme/app_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final String? svgIconPath;
  final double sizeFont;

  const TitleSection({
  super.key, 
  required this.title, 
  required this.svgIconPath,
  this.sizeFont = 18
  });

  @override
Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,      
        child: Row(
          children: [
            if (svgIconPath != null) ...[
              SvgPicture.asset(svgIconPath!),
              const SizedBox(width: 12), 
            ],
            Text(
              title,
              style: AppTextStyles.title.copyWith(
                fontSize: sizeFont,
              ),
            ),
          ],
        ),

    );
  }
}