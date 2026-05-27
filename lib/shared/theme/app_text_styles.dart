import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:taggr/shared/theme/app_colors.dart';


class AppTextStyles {

static TextStyle get title => GoogleFonts.bebasNeue(
    fontSize: 18,
    color: Colors.white,
    letterSpacing: 2.0,
    height: 1.1,
  );

static TextStyle get subtitle => GoogleFonts.bebasNeue(
    fontSize: 32,
    color: AppColors.textPrimary,
    letterSpacing: 1.5,
  );

// mas generales
  static TextStyle get body => GoogleFonts.poppins(
    fontSize: 16,
    color: AppColors.textPrimary,
  );

  static TextStyle get caption => GoogleFonts.poppins(
    fontSize: 14,
    color: AppColors.neonBlue, 
  );
}
