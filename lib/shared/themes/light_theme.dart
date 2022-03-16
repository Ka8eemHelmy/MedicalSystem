import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_medical/shared/components/constant.dart';

ThemeData lightTheme (context){
  return ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(
      Theme.of(context).textTheme,
    ).apply(bodyColor: primaryColor),
    //primarySwatch: primaryColor,
      primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      //  toolbarHeight: 80,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      iconTheme: IconThemeData(
        color: primaryColor,
      ),
      color: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(),
    ),
  );
}