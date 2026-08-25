import 'package:admen_app/core/constant/appcolor.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
        fontFamily: "playfairDisplay",     
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Appcolor.primaryColor),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[50], 
          titleTextStyle:TextStyle(color: Appcolor.primaryColor , fontWeight: FontWeight.bold , fontSize: 25),
          centerTitle: true,
          elevation: 0,
        ),
        
        textTheme: TextTheme( 
          headlineLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Appcolor.black,
          ),
          headlineMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,   
            color: Appcolor.black,
          ),
          bodyLarge: TextStyle(height: 2, color: Appcolor.grey, fontSize: 15),
          bodyMedium: TextStyle(height: 2, color: Appcolor.grey, fontSize: 12),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      );

ThemeData themeArabic = ThemeData(
        fontFamily: "Cario",
        textTheme: TextTheme( 
          headlineLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Appcolor.black,
          ),
          headlineMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Appcolor.black,
          ),
          bodyLarge: TextStyle(height: 2, color: Appcolor.grey, fontSize: 15),
          bodyMedium: TextStyle(height: 2, color: Appcolor.grey, fontSize: 12),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      );