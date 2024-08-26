import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color(0xFFCB395C);
const secondaryColor = Color(0xFF1C1C1D);
const dividerColor = Color(0xFF313131);
const dialogBackgroundColor = Color(0xFFA1A1A1);
final themeData = ThemeData();

final darkTheme = ThemeData(
  useMaterial3: true,
    primaryColor: primaryColor,
    secondaryHeaderColor: secondaryColor,
    dividerColor: dividerColor,
    textTheme: textTheme,
    dialogBackgroundColor: dialogBackgroundColor,
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.dark,
    ),
);

final textTheme = TextTheme(
  titleMedium: GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  ),
  titleSmall: GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w400,
      color: Colors.white54
  ),
  titleLarge: GoogleFonts.montserrat(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Colors.white54
  ),
  headlineLarge: GoogleFonts.montserrat(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  ),
  displaySmall: GoogleFonts.montserrat(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: Colors.white54
  ),
);