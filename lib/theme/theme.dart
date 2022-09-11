import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_pay/theme/theme_constants.dart';

final floatingActionButtonThemeData = FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
    elevation: 0.0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius)));

final elevatedButtonThemeData = ElevatedButtonThemeData(
  style: TextButton.styleFrom(
    backgroundColor: primaryColor,
    padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
  ),
);
final lightThemeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
  elevatedButtonTheme: elevatedButtonThemeData,
  floatingActionButtonTheme: floatingActionButtonThemeData,
);

final darkThemeData = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
    scaffoldBackgroundColor: bgColorDarkTheme,
    elevatedButtonTheme: elevatedButtonThemeData);

// final textThemeData = TextTheme(
//   headline1: GoogleFonts.poppins(
//       fontSize: 36.0, fontWeight: FontWeight.w600, color: textColorDarkTheme),
//   headline2: GoogleFonts.poppins(
//       fontSize: 30.0, fontWeight: FontWeight.w600, color: textColorDarkTheme),
//   headline3: GoogleFonts.poppins(
//       fontSize: 24.0, fontWeight: FontWeight.w600, color: textColorDarkTheme),
//   headline4: GoogleFonts.poppins(
//       fontSize: 20.0, fontWeight: FontWeight.w600, color: textColorDarkTheme),
//   headline5: GoogleFonts.poppins(
//       fontSize: 16.0, fontWeight: FontWeight.w600, color: textColorDarkTheme),
//   headline6: GoogleFonts.poppins(
//       fontSize: 14.0, fontWeight: FontWeight.w600, color: textColorDarkTheme),
//   bodyText1: GoogleFonts.poppins(
//       fontSize: 16.0, fontWeight: FontWeight.w400, color: textColorDarkTheme),
//   bodyText2: GoogleFonts.poppins(
//       fontSize: 14.0, fontWeight: FontWeight.w400, color: textColorDarkTheme),
//   button: GoogleFonts.poppins(
//       fontSize: 14.0, fontWeight: FontWeight.w500, color: textColorDarkTheme),
//   caption: GoogleFonts.poppins(
//       fontSize: 12.0, fontWeight: FontWeight.w400, color: textColorDarkTheme),
//   overline: GoogleFonts.poppins(
//       fontSize: 10.0, fontWeight: FontWeight.w400, color: textColorDarkTheme),
// );
