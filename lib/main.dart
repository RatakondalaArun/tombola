import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'blocs/generator_bloc/generator_bloc.dart';
import 'ui/screen/homescreen/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GeneratorBloc>(
      create: (_) => GeneratorBloc(),
      child: MaterialApp(
        title: 'Tombola',
        theme: getLightTheme(context),
        // darkTheme: getDarkTheme(context),
        home: HomeScreen(),
      ),
    );
  }
}

ThemeData getDarkTheme(BuildContext context) {
  return ThemeData(
    primarySwatch: Colors.green,
    primaryColor: Color(0xff34334d),
    backgroundColor: Color(0xff68659a),
    indicatorColor: Color(0xff0E1D36),
    buttonColor: Color(0xff3B3B3B),
    hintColor: Color(0xff280C0B),
    highlightColor: Color(0xff372901),
    hoverColor: Color(0xff3A3A3B),
    focusColor: Color(0xff0B2512),
    disabledColor: Colors.grey,
    textSelectionColor: Colors.white,
    cardColor: Color(0xFF151515),
    canvasColor: Color(0xff34334d),
    brightness: Brightness.dark,
    buttonTheme:
        Theme.of(context).buttonTheme.copyWith(colorScheme: ColorScheme.dark()),
    appBarTheme: AppBarTheme(
      elevation: 0.0,
    ),
    primaryTextTheme: TextTheme(
      headline1: GoogleFonts.gochiHand(),
      headline4: GoogleFonts.roboto(),
    ),
  );
}

ThemeData getLightTheme(BuildContext context) {
  return ThemeData(
    primarySwatch: Colors.green,
    primaryColor: Colors.white,
    backgroundColor: Color(0xffF1F5FB),
    indicatorColor: Color(0xffCBDCF8),
    buttonColor: Color(0xffF1F5FB),
    hintColor: Color(0xffEECED3),
    highlightColor: Color(0xffFCE192),
    hoverColor: Color(0xffd4e3fc),
    focusColor: Color(0xffA8DAB5),
    disabledColor: Colors.grey,
    textSelectionColor: Colors.black,
    cardColor: Colors.white,
    canvasColor: Colors.grey[50],
    brightness: Brightness.light,
    buttonTheme: Theme.of(context)
        .buttonTheme
        .copyWith(colorScheme: ColorScheme.light()),
    appBarTheme: AppBarTheme(
      elevation: 0.0,
    ),
    primaryTextTheme: TextTheme(
      headline1: GoogleFonts.gochiHand(),
      headline4: GoogleFonts.roboto(),
    ),
  );
}
