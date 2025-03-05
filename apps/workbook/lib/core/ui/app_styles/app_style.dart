// ignore_for_file: prefer_int_literals

/* global styles to use across the app
*/

import 'package:flutter/material.dart';

// -- THEME --
class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    scaffoldBackgroundColor: defaultScaffoldBackgroundColor,
    snackBarTheme: defaultSnackbarTheme,
    fontFamily: 'Hind',
    appBarTheme: const AppBarTheme(
      backgroundColor: defaultHeaderColor,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkScaffoldBackgroundColor,
    snackBarTheme: darkSnackbarTheme,
    fontFamily: 'Hind',
    appBarTheme: const AppBarTheme(
      backgroundColor: darkHeaderColor,
    ),
  );
}
// -- scaffold -- 
const defaultScaffoldBackgroundColor = Colors.white;
const darkScaffoldBackgroundColor = Color(0xFF006e8c);

// -- header --
const Color defaultHeaderColor = Color(0xFF006e8c);
const Color darkHeaderColor = Color(0xFF00475B);

// -- padding --
const EdgeInsets screenPadding =
    EdgeInsets.symmetric(horizontal: 24, vertical: 24);

// -- sized box --
const double spaceBetweenLines = 24;
const double spaceBetweenLinesSmall = 14;
const double spaceBetweenLinesLarge = 34;

// -- buttons --
const Color greyIconColor = Color(0x70BDBDBD);
const Color defaultButtonColor = Color(0xFF008db1);
const EdgeInsets defaultButtonPadding =
    EdgeInsets.symmetric(vertical: 14, horizontal: 22);
const double roundedButtonRadius = 50;

// snackbar
const defaultSnackBarBakgroundColor = Color(0xFF90C0D0);
const defaultSnackBarTextColor = Color(0xFF1F292C);
const darkSnackBarBakgroundColor = Colors.black;
const darkSnackBarTextColor = Colors.white;

const defaultSnackbarTheme = SnackBarThemeData(
  backgroundColor: defaultSnackBarBakgroundColor,
  actionTextColor: defaultSnackBarTextColor,
);

const darkSnackbarTheme = SnackBarThemeData(
  backgroundColor: darkSnackBarBakgroundColor,
  actionTextColor: darkSnackBarTextColor,
);

// -- text --

const TextStyle whiteText = TextStyle(
  color: Colors.white,
);
const greyTextColor = Color(0xFF929191);

const TextStyle mBlackText = TextStyle(fontSize: 14, color: Colors.black);
const TextStyle mBlackLabel =
    TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold);

const TextStyle mBlackLongText =
    TextStyle(fontSize: 14, color: Colors.black, height: 1.5);

const TextStyle mGreyText = TextStyle(fontSize: 14, color: greyTextColor);
const TextStyle mGreyLabel =
    TextStyle(fontSize: 14, color: greyTextColor, fontWeight: FontWeight.bold);

const TextStyle sGreyText = TextStyle(fontSize: 12, color: greyTextColor);

// -- input text --
const inputTextDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(18.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent),
    borderRadius: BorderRadius.all(Radius.circular(18.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(18.0)),
  ),
);
