import 'package:flutter/material.dart';

// light
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.blueGrey[100]!,
    primary: Colors.blueGrey[200]!,
    secondary: Colors.blueGrey[300]!,
    inversePrimary: Colors.blueGrey[900]!,
  ),
);

// dark
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.blueGrey[900]!,
    primary: Colors.blueGrey[800]!, // Alterado de 850 para 800
    secondary: Colors
        .blueGrey[700]!, // Alterado de 800 para 700 (ou mantenha 800 se preferir)
    inversePrimary: Colors.blueGrey[100]!,
  ),
);
