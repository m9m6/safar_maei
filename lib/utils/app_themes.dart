import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppThemes{
  static final ThemeData fontTheme = ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(),
  );


  static final ThemeData backgroundLightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
  );

  static final ThemeData loginbackgroundTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white
  );

}