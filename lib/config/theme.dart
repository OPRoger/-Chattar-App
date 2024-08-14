import 'package:chat_application/config/color.dart';
import 'package:flutter/material.dart';


  var lightTheme = ThemeData();
    var darkTheme = ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: dContainerColor
        ),
        inputDecorationTheme: const InputDecorationTheme(
          fillColor: dBackgroundColor,
          filled: true,
        ),
        colorScheme: const  ColorScheme.dark(
            primary: dPrimaryColor,
            onPrimary: dOnBackgroundColor,
            background: dBackgroundColor,
            onBackground: dOnBackgroundColor,
            primaryContainer: dContainerColor,
            onPrimaryContainer: dContainerColor
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,color: dPrimaryColor,fontFamily: "Poppins",fontWeight: FontWeight.w800
      ),
      headlineMedium: TextStyle(
          fontSize: 30,color: dOnBackgroundColor,fontFamily: "Poppins",fontWeight: FontWeight.w600
      ),
      headlineSmall: TextStyle(
          fontSize: 20,color: dOnBackgroundColor,fontFamily: "Poppins",fontWeight: FontWeight.w600
      ),
      labelLarge: TextStyle(
          fontSize: 15,color: donContainerColor,fontFamily: "Poppins",fontWeight: FontWeight.w400
      ),
      labelMedium: TextStyle(
          fontSize: 12,color: donContainerColor,fontFamily: "Poppins",fontWeight: FontWeight.w400
      ),
      labelSmall: TextStyle(
          fontSize: 10,color: donContainerColor,fontFamily: "Poppins",fontWeight: FontWeight.w200
      ),
    )
);
