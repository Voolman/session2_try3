import 'package:flutter/material.dart';

var theme = ThemeData(
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          fontFamily: "Roboto",
          color: Color.fromARGB(255, 58, 58, 58)
      ),
      titleMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamily: "Roboto",
          color: Color.fromARGB(255, 167, 167, 167)
      ),
      titleSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontFamily: "Roboto",
          color: Color.fromARGB(255, 167, 167, 167)
      )
    ),
    filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 5, 96, 250),
            disabledBackgroundColor: const Color.fromARGB(255, 167, 167, 167),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4)
            )
        )
    ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedLabelStyle: TextStyle(
        color: Color.fromARGB(255, 167, 167, 167),
        fontSize: 12,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal
    ),
    unselectedLabelStyle: TextStyle(
        color: Color.fromARGB(255, 5, 96, 250),
        fontSize: 12,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal
    ),
  )
);